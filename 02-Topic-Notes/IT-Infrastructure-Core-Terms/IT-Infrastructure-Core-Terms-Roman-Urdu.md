# IT Infrastructure — Core Terms Study Notes

**Language:** Roman Urdu with English technical definitions  
**Learning context:** VMware home lab, Windows DNS servers, Linux, aur Azure foundations  
**Prepared:** 31 October 2026  
**Suggested repository location:** `02-Topic-Notes/IT-Infrastructure-Core-Terms-Roman-Urdu.md`

> **Maqsad:** CPU, RAM, disk, network interface, OS, server, VM, service, application, cloud, data, database aur workload ko ek doosray ke saath relate karke samajhna.

## Contents

1. [Aap ke lab ka overview](#1-aap-ke-lab-ka-overview)
2. [CPU](#2-cpu)
3. [RAM](#3-ram)
4. [Disk aur storage](#4-disk-aur-storage)
5. [Network interface](#5-network-interface)
6. [Operating system](#6-operating-system)
7. [Server](#7-server)
8. [Virtual machine aur hypervisor](#8-virtual-machine-aur-hypervisor)
9. [Service](#9-service)
10. [Application](#10-application)
11. [Cloud](#11-cloud)
12. [Data](#12-data)
13. [Database aur DBMS](#13-database-aur-dbms)
14. [Workload](#14-workload)
15. [DNS request ki misaal](#15-dns-request-ki-misaal)
16. [Website ki misaal](#16-website-ki-misaal)
17. [Common confusions](#17-common-confusions)
18. [Apne environment mein verification](#18-apne-environment-mein-verification)
19. [Quick revision](#19-quick-revision)
20. [Practice questions aur answers](#20-practice-questions-aur-answers)

## 1. Aap Ke Lab Ka Overview

Aap ka physical computer **host** hai. Agar us par VMware Workstation chal raha hai to Workstation ke andar DNS01, DNS02 aur DNS03 jaisi **virtual machines** run ho sakti hain. Har VM apna guest OS chalati hai aur host ke physical resources use karti hai.

| Layer | Aap ke lab mein misaal | Zimmedari |
|---|---|---|
| Physical hardware | Aap ka desktop ya laptop | CPU, RAM, disks aur physical connectivity |
| Host OS | Workstation walay computer ka Windows OS | Physical computer aur host applications manage karna |
| Virtualization software | VMware Workstation | VMs create aur run karna |
| Guest machine | DNS01 VM | Ek virtual computer provide karna |
| Guest OS | DNS01 ke andar Windows Server | VM ke resources aur software manage karna |
| Service | DNS Server service | DNS queries ka jawab dena |
| Data | DNS records aur logs | Information store karna |
| Workload | DNS name resolution | Service ka kaam aur us ki resource needs |

**ESXi ka farq:** ESXi bare-metal hypervisor hai; usay Workstation ki tarah Windows host OS ke upar install karna zaroori nahin. Agar aap ESXi ko Workstation ki VM mein chala rahe hain to woh **nested virtualization** hai. Yeh table Workstation ke simple setup ki misaal hai, har lab ki exact topology nahin.

## 2. CPU

**Full form:** Central Processing Unit  
**English definition:** The processor executes instructions used by the operating system and applications.

### Kya Hai?

CPU instructions execute karta hai. Calculation, program logic aur processing ke liye CPU kaam karta hai.

### Aap Ke Lab Mein

DNS01 ko query aati hai to CPU DNS software ki instructions execute karta hai. Linux mein command chalana ya log processing bhi CPU use karta hai.

### Physical CPU Aur vCPU

- **Physical CPU:** host ka asal processor.
- **Core:** processor ka processing unit.
- **vCPU:** VM ko nazar anay wala virtual processor, jis ki execution host schedule karta hai.

VM ko **2 vCPU** denay ka matlab yeh nahin ke do physical cores us VM ke liye permanently reserve ho gaye. Actual scheduling aur resource controls virtualization configuration par depend kartay hain.

### Yaad Rakhein

High CPU usage akela fault ka saboot nahin. Duration, workload, normal baseline aur user impact dekhein. Agar host par kai VMs busy hon to woh CPU capacity ke liye compete kar sakti hain.

## 3. RAM

**Full form:** Random Access Memory  
**English definition:** RAM holds instructions and data that running software needs to access quickly.

### Kya Hai?

RAM running OS, programs aur un ke working data ki temporary memory hai. Aam RAM volatile hoti hai: power hatnay par us ka content retain nahin rehta. Hibernate ya saved-state features memory content ko disk par save kar saktay hain; is se RAM permanent storage nahin ban jati.

### Aap Ke Lab Mein

DNS01 ka Windows Server, DNS service aur cache RAM use kartay hain. VMware host par Windows aur Workstation ko bhi RAM chahiye.

**Misaal:** agar 16 GB host RAM mein teen VMs ko 4 GB each configure karein to un ki configured RAM ka total 12 GB hai. Host OS aur virtualization overhead ke liye bhi capacity plan karni hogi. Actual usage configuration aur workload ke mutabiq badalta hai.

### RAM Kam Ho To

OS paging/swapping kar sakta hai aur performance slow ho sakti hai. Sirf VM memory barhanay se pehlay host ki available capacity check karein.

## 4. Disk Aur Storage

**English definition:** Storage retains the operating system, applications, configuration, and data beyond the lifetime of a running process.

### Kya Hai?

SSD/HDD par OS, installed software, files aur configuration save hoti hain. Power off honay par saved data aam tor par rehta hai, lekin hardware failure ya deletion se loss ho sakta hai. Permanent storage ka matlab guaranteed safe storage nahin; backup phir bhi chahiye.

### Aap Ke Lab Mein

DNS01 ka Windows Server, zone files—agar file-backed zones use hon—aur logs virtual disk par hotay hain. VMware Workstation ki virtual disk aam tor par `.vmdk` files se represent hoti hai, jo host storage par rehti hain.

| Cheez | Matlab |
|---|---|
| Physical disk | Host ki SSD/HDD |
| Virtual disk | VM ko di gayi disk |
| Capacity | Kitna data store ho sakta hai |
| Performance | Reads/writes kitni jaldi hoti hain |

**Misaal:** 60 GB growable virtual disk ki host par file shuru mein 60 GB se chhoti ho sakti hai aur usage ke saath barh sakti hai. Preallocated disks ka behavior alag ho sakta hai. Guest free space aur host free space dono check karein.

**Important:** teen VMs ki disks agar ek hi physical disk par hon to woh physical storage performance share karti hain.

## 5. Network Interface

**Related terms:** NIC — Network Interface Card/Controller; vNIC — virtual NIC  
**English definition:** A network interface provides a connection through which a system sends and receives network traffic.

### Kya Hai?

Network interface system ko network par communicate karnay ka rasta deti hai. Physical examples Ethernet aur Wi-Fi adapters hain. VM ke andar virtual adapter hota hai.

IP address interface par configure ho sakta hai. Har interface ka sirf ek IP hona zaroori nahin, aur adapter mojood honay se connectivity automatically prove nahin hoti.

### Aap Ke Lab Mein

DNS02 query apni vNIC se bhejta hai. VMware virtual networking us traffic ko DNS01 ki taraf le jati hai. Agar dono VMs same host ke virtual network mein hon to un ka traffic zaroori nahin ke physical Wi-Fi se guzray.

| VMware Mode | Bunyadi idea | Aham baat |
|---|---|---|
| Bridged | VM ko external LAN par connectivity deta hai | IP assignment aur reachability LAN/configuration par depend karti hai |
| NAT | VM private virtual network se translated outbound connectivity use karti hai | Inbound access ke liye alag configuration chahiye ho sakti hai |
| Host-only | Host aur attached VMs ke darmiyan private virtual network | Aam tor par direct internet access provide nahin karta |

Physical NIC, vNIC, IP address aur firewall rule alag cheezein hain. Connectivity ke liye in ka sahi combination chahiye.

## 6. Operating System

**Abbreviation:** OS  
**English definition:** An operating system manages hardware resources and provides an environment for programs to run.

### Kya Karta Hai?

OS CPU scheduling, memory, disks, devices, users aur processes manage karta hai. Applications ko hardware use karnay ke interfaces deta hai.

### Aap Ke Lab Mein

- Workstation walay physical computer par Windows: **host OS**.
- DNS01 VM ke andar Windows Server: **guest OS**.
- Linux VM ke andar Rocky Linux ya Ubuntu: us VM ka **guest OS**.

**Important distinction:** Windows Server OS ka product naam hai. DNS server machine ka functional role hai. OS install karnay se DNS role automatically configured nahin ho jata.

## 7. Server

**English definition:** A server provides functionality or resources to clients over a defined interface or network.

Server lafz context ke mutabiq teen tarah use hota hai:

| Context | Misaal |
|---|---|
| Hardware | Physical rack server |
| Machine ka role | DNS01 DNS server hai |
| Software | DNS server software queries answer karta hai |

### Aap Ke Lab Mein

DNS01 ek **VM bhi hai** aur **DNS server bhi**. VM us ki machine type batata hai; server us ka role batata hai. DNS02, DNS01 se zone transfer mangtay waqt client ka role perform kar sakta hai, jabke doosri queries ke liye khud server hota hai.

Server ko physical hona ya Windows chalana zaroori nahin. Linux VM bhi web, DNS, database ya file server ho sakti hai.

## 8. Virtual Machine Aur Hypervisor

**Abbreviation:** VM — Virtual Machine  
**English definition:** A VM is a software-defined computer with virtual processing, memory, storage, and networking resources.

### VM Mein Kya Hota Hai?

| Resource | Illustrative configuration |
|---|---|
| vCPU | 2 |
| RAM | 4 GB |
| Virtual disk | 60 GB |
| vNIC | 1 |
| Guest OS | Windows Server |

**Yeh example settings hain; aap ki actual DNS01 configuration ka dawa nahin.**

**Hypervisor** VMs ko run karwata hai aur un ki access to host resources manage karta hai. VMware Workstation aur ESXi virtualization platforms ki misaalein hain, lekin un ki installation architecture alag hai.

VM ek computer hai. Us ke andar OS, applications aur services hoti hain. Kai VMs ek physical host share kar sakti hain; host failure un sab ko affect kar sakta hai.

## 9. Service

**English definition:** A service provides a defined function; in OS administration, the term often refers to software managed to run in the background.

### Aap Ke Lab Mein

- Windows **DNS Server service:** name resolution provide karti hai.
- Linux **sshd service:** SSH remote access provide karti hai.
- Linux **nginx service:** configured web serving/reverse proxy function provide kar sakti hai.

Service sirf tab kaam karti hai jab us ki configuration aur dependencies theek hon. “Running” status useful check hai, lekin end-to-end successful request zyada mazboot verification hai.

**Context ka farq:** Azure service jaisa broad lafz hamesha ek local background process ko refer nahin karta. Service ka exact matlab context se samjhein.

## 10. Application

**English definition:** An application is software designed to perform a specific task or set of tasks.

### Aap Ke Environment Mein

| Application | Kaam |
|---|---|
| Chrome | Websites access karna |
| VS Code | Notes aur code edit karna |
| VMware Workstation | Virtual machines manage aur run karna |
| DNS Manager | DNS configuration administer karna |
| NGINX | Web serving ya reverse proxy, configuration ke mutabiq |

### Application Aur Service Ka Rishta

Yeh categories overlap karti hain. NGINX ek server application hai jo background service ke taur par chal sakti hai. Har application ko interactive window chahiye nahin, aur har application service nahin hoti.

**DNS Manager** management tool hai; **DNS Server service** DNS queries answer karti hai. Management window band karnay se background DNS service lazmi band nahin hoti.

## 11. Cloud

**English definition:** Cloud computing provides on-demand access to shared computing resources and services that can be provisioned and managed through service interfaces.

### Aap Ke Lab Se Connection

VMware home lab mein aap host hardware operate kartay hain. Cloud mein Azure jaisa provider infrastructure aur services supply karta hai. Aap VM ya doosri service provision aur configure kar saktay hain.

| Pehlu | Home VMware Lab | Azure VM Ki Misaal |
|---|---|---|
| Physical hardware | Aap operate kartay hain | Provider operate karta hai |
| Power/cooling | Aap ka arrangement | Provider ka arrangement |
| VM configuration | Aap configure kartay hain | Aap configure kartay hain |
| Guest OS aur workload | Aap manage kartay hain | Customer responsibilities aam tor par baqi rehti hain |
| Capacity/cost | Host ki capacity aur apne operating costs | Chuni hui services, usage aur agreement ke mutabiq |

**Shared responsibility:** service type ke mutabiq responsibilities badalti hain. Azure VM ki misaal ko tamam managed cloud services par bilkul same apply na karein.

**Yaad rakhein:** sirf VMs banana private cloud honay ka saboot nahin. Cloud public, private ya hybrid ho sakta hai; is liye cloud ko sirf “internet par kisi aur ka computer” kehna mukammal definition nahin.

## 12. Data

**English definition:** Data is information represented in a form that can be stored, processed, or transmitted.

### Aap Ke Lab Mein

Data ki misaalein:

- Hostnames aur IP addresses.
- DNS records aur logs.
- Usernames aur configuration files.
- Screenshots, PDFs aur Markdown notes.
- Monitoring measurements, jaisay CPU percentage.

**Illustrative DNS record:**

```text
dns01.vcplab.com → 10.0.0.20
```

**Yeh IP samajhnay ki misaal hai; actual server address verify karein.** Hostname aur IP data hain. DNS service in records ko use karke queries answer karti hai.

Data disk par stored ho sakta hai, RAM mein process ho sakta hai aur network par transmit ho sakta hai. Data ka matlab sirf files ya database rows nahin.

## 13. Database Aur DBMS

**Database — English definition:** An organized collection of related data that can be retrieved and updated.

**DBMS — Full form:** Database Management System  
**DBMS — English definition:** Software used to store, query, update, and manage databases.

| Cheez | Misaal |
|---|---|
| Data | Khalid ka naam aur selected course |
| Database | Learners aur enrollments ka organized collection |
| DBMS | PostgreSQL, MySQL ya Microsoft SQL Server |
| Database server | DBMS host/provide karnay wali machine ya software, context ke mutabiq |

### Illustrative Records

| User ID | Name | Course |
|---|---|---|
| 101 | Khalid | Azure |
| 102 | Ahmed | Linux |

Yeh sirf sample records hain. Har database table-based nahin hota; mukhtalif database models hotay hain.

### DNS Ke Saath Connection

DNS records structured information hain. Windows DNS configuration ke mutabiq zone data file-backed ho sakta hai ya Active Directory mein store ho sakta hai. DNS chalane ke liye MySQL install karna zaroori nahin.

**Important:** data collection aur usay manage karnay wala software alag terms hain. NGINX web-server/reverse-proxy software hai; woh PostgreSQL jaisa database engine nahin.

## 14. Workload

**English definition:** A workload is an application, service, or set of components performing a task, together with the resources and operating requirements needed to support it.

### DNS Workload

Aap ke DNS workload mein yeh shamil ho saktay hain:

- DNS service aur us ki configuration.
- DNS records aur cache.
- Queries receive aur answer karnay ka kaam.
- Required CPU, RAM, storage aur network capacity.
- Availability, security aur monitoring requirements.

| Term | DNS01 Mein Matlab |
|---|---|
| VM | Computer jis par kaam chal raha hai |
| OS | Windows Server jo machine manage karta hai |
| Service | DNS software jo name resolution provide karta hai |
| Data | Records, cache aur logs |
| Workload | DNS functionality aur us ki tamam relevant needs |

### Workload Aur Load Ka Farq

**Workload:** kaunsa kaam chal raha hai aur usay kya resources chahiye.  
**Load:** us waqt kitni demand aa rahi hai, jaisay queries per second.

Queries barhnay par capacity ki zaroorat barh sakti hai, lekin har resource har waqt proportionally nahin barhta. Actual measurements se sizing karein.

Ek workload kai VMs aur services par phail sakta hai. Ek VM par bhi kai workloads chal saktay hain.

## 15. DNS Request Ki Misaal

**Scenario:** DNS02 ko DNS01 se ek hostname resolve karwana hai.

1. DNS02 request generate karta hai aur network interface se bhejta hai.
2. VMware virtual network configured path ke mutabiq traffic DNS01 tak pohanchata hai.
3. DNS01 ka OS traffic DNS service tak deliver karta hai.
4. CPU instructions execute karta hai aur RAM mein working information use hoti hai.
5. DNS service apni configuration, cache, zone data ya doosray DNS servers se available information ke mutabiq jawab tayyar karti hai.
6. Jawab network interface se DNS02 ko wapas jata hai.
7. Configured logging ya updates zaroorat ke mutabiq storage use kar saktay hain.

**Important:** har DNS request ke liye disk read lazmi nahin; relevant data RAM/cache mein pehlay se ho sakta hai. Physical hardware ke resources poori process ko support kartay hain.

## 16. Website Ki Misaal

**Yeh learning example hai; aap ke lab mein deploy honay ka dawa nahin.**

| Term | Example |
|---|---|
| Cloud | Azure jahan resources provision hotay hain |
| VM | Ubuntu virtual machine |
| OS | Ubuntu Linux |
| CPU | Web requests ki processing |
| RAM | Running processes aur working data |
| Disk | OS, application files aur logs |
| Network interface | Requests receive aur responses send karna |
| Server | VM ka web-server role |
| Application | Website ka software |
| Service | NGINX ka background service process |
| Data | Names, course information aur orders |
| Database | Organized user aur order records |
| DBMS | PostgreSQL ya MySQL |
| Workload | Website chalana, requests process karna aur data access karna |

Website application aur database ek VM par ho saktay hain ya alag systems par. Sahi design requirements, cost, security aur availability par depend karta hai.

## 17. Common Confusions

| Confusion | Sahi Samajh |
|---|---|
| RAM aur disk ek hi cheez hain | RAM active working memory; disk retained storage hai |
| VM ko 2 vCPU diye to 2 physical cores reserve ho gaye | Reservation/scheduling configuration alag matter hai |
| Har VM ka traffic physical Wi-Fi se guzarta hai | Same-host virtual traffic virtual network ke andar reh sakta hai |
| Server hamesha physical machine hai | Server VM ya software role bhi ho sakta hai |
| Windows Server install kiya to DNS ready hai | DNS role aur configuration separately chahiye |
| VM aur OS same hain | VM computer; OS us ke andar chalnay wala system software hai |
| Application sirf window wala software hai | Background server applications bhi hoti hain |
| Service running hai to sab theek hai | Configuration aur end-to-end function bhi verify karein |
| Database aur DBMS same term hain | Database collection; DBMS management software hai |
| Har workload ek VM hai | Workload kai resources aur systems use kar sakta hai |
| Cloud sirf virtualization hai | Cloud service delivery aur provisioning model bhi rakhta hai |
| High CPU hamesha P1 hai | Impact, urgency, duration aur policy bhi matter karti hai |

## 18. Apne Environment Mein Verification

Yeh read-only checks hain. Apni actual results notes mein record karein; example values ko apni configuration na samjhein.

### VMware Workstation

VM select karke us ki settings mein processors, memory, hard disk aur network adapter dekhein. Pehlay sirf observe karein; resource change karna is exercise ka hissa nahin.

### Windows Host Ya Windows Guest

**Task Manager → Performance** mein CPU, memory, disks aur adapters dekhein. Host par host resources; guest ke andar VM ko nazar anay walay resources dikhte hain.

PowerShell mein:

```powershell
# OS details
Get-CimInstance Win32_OperatingSystem |
    Select-Object Caption, Version, TotalVisibleMemorySize, FreePhysicalMemory

# Processor details as visible to this OS
Get-CimInstance Win32_Processor |
    Select-Object Name, NumberOfCores, NumberOfLogicalProcessors

# Filesystem drives
Get-PSDrive -PSProvider FileSystem

# Network interface and IP configuration
Get-NetIPConfiguration

# DNS Server service, if installed on this machine
Get-Service -Name DNS -ErrorAction SilentlyContinue
```

Memory fields shown here use KB units. DNS command ka koi output na aaye to isi se service failure prove nahin hota; mumkin hai DNS Server service is machine par installed hi na ho.

### Linux Host Ya Linux Guest

```bash
# OS identification
cat /etc/os-release

# CPU details
lscpu

# RAM usage
free -h

# Block devices and filesystems
lsblk

# Mounted filesystem space
df -h

# Network interfaces and addresses
ip -brief address

# Running services on a systemd-based environment
systemctl --type=service --state=running
```

`systemctl` ke liye systemd running hona chahiye. Guest commands physical host ki complete hardware inventory nahin dikhate; virtualized hardware information aa sakti hai. Networking mein virtual aur loopback interfaces bhi nazar aa sakti hain.

### Apni Findings Likhein

| System | Host/Guest | OS | CPU/vCPU | RAM | Disk | Network Mode/Interface | Main Role |
|---|---|---|---|---|---|---|---|
| Physical computer | Host |  |  |  |  |  | VMware host |
| DNS01 | Guest |  |  |  |  |  | DNS |
| DNS02 | Guest |  |  |  |  |  | DNS |
| DNS03 | Guest |  |  |  |  |  | DNS |
| Linux VM, if present | Guest |  |  |  |  |  |  |

## 19. Quick Revision

| Term | Ek Line Mein |
|---|---|
| CPU | Instructions execute karta hai |
| RAM | Running software ka working data rakhti hai |
| Disk | OS, files aur saved data rakhti hai |
| Network interface | Traffic send/receive karnay ka connection |
| OS | Resources aur programs manage karta hai |
| Server | Clients ko functionality provide karta hai |
| VM | Virtual resources wala computer |
| Hypervisor | VMs run aur un ki resource access manage karta hai |
| Service | Defined function; OS context mein aksar background software |
| Application | Specific task karnay wala software |
| Cloud | On-demand computing services ka model |
| Data | Information |
| Database | Organized related data |
| DBMS | Database manage karnay wala software |
| Workload | Kaam perform karnay walay components aur un ki requirements |

**DNS01 ko ek jumlay mein:** DNS01 ek VM hai jo physical host ke resources use karti hai, Windows Server OS chalati hai, aur DNS service ke zariye DNS data ko use karke name-resolution workload perform karti hai.

## 20. Practice Questions Aur Answers

### Pehlay Khud Jawab Dein

1. DNS01 ko CPU, RAM, disk aur network interface kyun chahiye?
2. Physical CPU aur vCPU ka kya rishta hai?
3. DNS01 VM hai ya server?
4. Host OS aur guest OS ka farq kya hai?
5. DNS Manager band kar dein to DNS service lazmi band hoti hai?
6. Kya har DNS query disk se data read karti hai?
7. Database aur DBMS mein kya farq hai?
8. Workload aur load mein kya farq hai?
9. Kya do VMs ki communication ko physical Wi-Fi chahiye hoti hai?
10. VMware home lab aur cloud mein responsibilities kaisay badalti hain?

### Answer Guide

1. CPU processing, RAM working memory, disk OS/data, aur interface communication ke liye.
2. vCPU virtual processor hai jis ki execution host CPU par schedule hoti hai.
3. Dono: VM machine type hai aur DNS server us ka role.
4. Host OS physical host par; guest OS VM ke andar chalta hai.
5. Nahin. DNS Manager management tool hai; background service alag chal sakti hai.
6. Nahin. Relevant information RAM/cache mein ho sakti hai.
7. Database organized data; DBMS usay manage karnay wala software.
8. Workload kaam aur us ki requirements; load us waqt ki demand.
9. Zaroori nahin. Same-host virtual network par traffic physical NIC use kiye baghair ja sakta hai.
10. Home lab mein hardware/facilities aap operate kartay hain. Cloud mein provider ki responsibilities barhti hain; customer ki remaining responsibilities selected service par depend karti hain.

### Completion Checklist

- [ ] Main tamam terms apnay alfaaz mein samjha sakta hoon.
- [ ] Main DNS01 ko VM, OS, service, data aur workload se relate kar sakta hoon.
- [ ] Main host aur guest resource views ka farq samajhta hoon.
- [ ] Main apne actual VM settings inspect karke table fill kar chuka hoon.
- [ ] Main application/service aur database/DBMS ka farq samjha sakta hoon.

## Repository Mein Kahan Rakhein?

File ko is location par rakhein:

```text
AZ-104-Azure-Administrator-Study/02-Topic-Notes/IT-Infrastructure-Core-Terms-Roman-Urdu.md
```

Root README mein yeh link add kar saktay hain:

```markdown
- [IT Infrastructure — Core Terms (Roman Urdu)](02-Topic-Notes/IT-Infrastructure-Core-Terms-Roman-Urdu.md)
```

Yeh cross-topic reference hai; Day 01 notes ke saath use karein aur baad ki classes mein zaroorat par dobara dekhein.
