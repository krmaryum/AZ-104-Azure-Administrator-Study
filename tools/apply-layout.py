#!/usr/bin/env python3
"""Preview/apply this reviewed layout to an existing clean Git checkout."""
from pathlib import Path, PurePosixPath
from datetime import datetime, timezone
import argparse, hashlib, json, shutil, subprocess, sys

def digest(data, name):
    if Path(name).suffix.lower() in {'.md','.txt','.sh','.html','.csv','.json'} or Path(name).name=='.gitignore':
        data=data.replace(b'\r\n',b'\n')
    return hashlib.sha256(data).hexdigest()

def run(repo,*args):
    return subprocess.check_output(['git','-C',str(repo),*args],text=True,stderr=subprocess.STDOUT).strip()

def safe(repo,rel):
    parts=PurePosixPath(rel).parts
    if not parts or '..' in parts or '.git' in parts or PurePosixPath(rel).is_absolute():
        raise ValueError('Unsafe path: '+rel)
    target=repo.joinpath(*parts)
    for component in [target,*target.parents]:
        if component==repo.parent:break
        if component.is_symlink():raise ValueError('Symlink path requires manual review: '+rel)
    target.resolve().relative_to(repo.resolve())
    return target

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo',required=True,help='Existing Git repository root')
    parser.add_argument('--apply',action='store_true',help='Apply after all checks pass; default is preview only')
    args=parser.parse_args()
    bundle=Path(__file__).resolve().parents[1]
    repo=Path(args.repo).expanduser().resolve()
    if repo==bundle or repo in bundle.parents or bundle in repo.parents:
        raise ValueError('Extract the bundle OUTSIDE your existing repository before running this utility.')
    manifest=json.loads((bundle/'migration-manifest.json').read_text())
    if Path(run(repo,'rev-parse','--show-toplevel')).resolve()!=repo:
        raise ValueError('--repo must be the root of an existing Git checkout.')
    if run(repo,'status','--porcelain'):
        raise ValueError('Working tree is not clean. Commit or otherwise preserve your pending work, then rerun.')
    errors=[]
    sources={r['source']:r for r in manifest['sources']}
    for rel,row in sources.items():
        target=safe(repo,rel)
        if not target.is_file():errors.append('Missing source: '+rel);continue
        if digest(target.read_bytes(),rel)!=row['normalized_source_sha256']:
            errors.append('Source changed since supplied ZIP: '+rel)
    for row in manifest['payload']:
        rel=row['path'];src=safe(bundle,rel);dest=safe(repo,rel)
        if not src.is_file() or hashlib.sha256(src.read_bytes()).hexdigest()!=row['sha256']:
            errors.append('Package content mismatch: '+rel);continue
        if dest.exists() and not dest.is_file():errors.append('Destination is not a file: '+rel)
        elif dest.is_file() and rel not in sources and digest(dest.read_bytes(),rel)!=digest(src.read_bytes(),rel):
            errors.append('Unrecognized destination content: '+rel)
    if errors:raise ValueError('\n'.join(errors)+'\nNothing was changed. Review differences before proceeding.')
    removed=[r['source'] for r in manifest['sources'] if r['source']!=r['destination']]
    print('Source checks passed:',len(sources),'files (Git metadata excluded).')
    print('Payload files:',len(manifest['payload']),'| Old file paths to retire:',len(removed))
    if not args.apply:
        print('PREVIEW ONLY. No files changed. Add --apply to perform this reviewed migration.')
        return
    backup=repo.parent/(repo.name+'-before-restructure-'+datetime.now(timezone.utc).strftime('%Y%m%d-%H%M%S-%f'))
    backup.mkdir()
    affected=set(sources)|{r['path'] for r in manifest['payload']}|{'migration-manifest.json'}
    existed=[];absent=[]
    for rel in sorted(affected):
        p=safe(repo,rel)
        if p.is_file():
            q=backup/'files'/rel;q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,q);existed.append(rel)
        elif not p.exists():absent.append(rel)
    (backup/'BACKUP_INDEX.json').write_text(json.dumps({'repo':str(repo),'existing_files':existed,'previously_absent':absent},indent=2))
    # Stage and validate all payload copies before touching the working tree.
    staging=backup/'payload';staging.mkdir()
    for row in manifest['payload']:
        q=staging/row['path'];q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(bundle/row['path'],q)
    try:
        for row in manifest['payload']:
            rel=row['path'];dest=safe(repo,rel);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(staging/rel,dest)
        shutil.copy2(bundle/'migration-manifest.json',repo/'migration-manifest.json')
        payload_paths={r['path'] for r in manifest['payload']}
        for rel in removed:
            if rel not in payload_paths:safe(repo,rel).unlink()
        for rel in sorted(manifest['empty_directories'],key=lambda s:len(PurePosixPath(s).parts),reverse=True):
            p=safe(repo,rel)
            try:p.rmdir()
            except OSError:pass
        parents=set()
        for rel in removed:
            p=safe(repo,rel).parent
            while p!=repo:parents.add(p);p=p.parent
        for p in sorted(parents,key=lambda p:len(p.parts),reverse=True):
            try:p.rmdir()
            except OSError:pass
        for row in manifest['payload']:
            if hashlib.sha256(safe(repo,row['path']).read_bytes()).hexdigest()!=row['sha256']:
                raise ValueError('Post-copy verification failed: '+row['path'])
    except Exception:
        for rel in absent:
            p=safe(repo,rel)
            if p.is_file():p.unlink()
        for rel in existed:
            dest=safe(repo,rel);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(backup/'files'/rel,dest)
        raise
    print('Applied and verified. Backup:',backup)
    print('Git history, remotes and unrelated files were not replaced. No commit or push was performed.')
    print('Next: inspect git status and git diff before committing.')
if __name__=='__main__':
    try:main()
    except (ValueError,OSError,subprocess.CalledProcessError) as exc:
        print('STOP:',exc,file=sys.stderr);sys.exit(1)
