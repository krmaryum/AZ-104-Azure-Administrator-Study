# Day 01 — Course Kickoff, Data-Center Foundations aur SLA

**Tareekh:** 31 October 2026  
**Course:** AZ-104 — Microsoft Azure Administrator  
**Revision:** 3 — behtar zaban aur tarteeb ke saath study edition  
**Recording:** [Day 01 — Course Kickoff aur Orientation](https://youtu.be/9Jk06-FvvH8)

## Aham Baatain Ek Nazar Mein

| Topic | Yaad Rakhnay Wali Baat |
|---|---|
| Requirements | Server ki tadaad aur size se pehlay workload samjhein. |
| Reliability | Power, rack, network aur site ki mushtarka dependencies pehchanein. |
| Zimmedari | Wazeh karein ke ownership, management, monitoring aur recovery kis ke paas hai. |
| Kharcha | Expense ki nature dekhein aur cloud ki jari rehnay wali charges check karein. |
| SLA | Agreement ke mutabiq response, restoration aur resolution ka farq samjhein. |

## Fehrist

- [1. Transcript ki coverage aur notes ka tareeqa](#section-1)
- [2. Lecture Mein Topics Ki Tarteeb](#section-2)
- [3. Seekhnay Ke Maqasid](#section-3)
- [4. Course ka maqsad aur certifications](#section-4)
- [5. Administration ke areas](#section-5)
- [6. Physical server, virtualization aur cloud](#section-6)
- [7. AVD aur remote desktop](#section-7)
- [8. Networking, resources aur monitoring](#section-8)
- [9. Markazi role-play — customer ko 15 servers chahiye](#section-9)
- [10. Cooling, power, racks aur failure domains](#section-10)
- [11. Security, ownership aur remote management](#section-11)
- [12. Private aur shared data center](#section-12)
- [13. CapEx aur OpEx — sahi explanation](#section-13)
- [14. SLA, priorities, response aur resolution](#section-14)
- [15. Glossary](#section-15)
- [16. Revision Checklist](#section-16)
- [17. Study ka order](#section-17)
- [18. Technical references](#section-18)

<a id="section-1"></a>

## 1. Transcript ki coverage aur notes ka tareeqa

Di gayi `Day-01-Complete-Transcript.txt` file mein captions **00:00:02 se 01:23:41** tak hain. Screenshot mein recording takreeban 01:23:43 thi. Yani timeline ke lihaz se lagbhag poori recording cover hoti hai, lekin har bola hua lafz capture honay ki guarantee nahin. Issue resolution par aakhri jumla adhoora reh gaya hai. Audio ko alag se verify nahin kiya gaya, aur kuch captions mein transcription errors ho saktay hain.

Yeh structured study notes hain, lafz-ba-lafz transcript nahin. Introductions aur dohrayi gayi guftagu ko mukhtasar kiya gaya hai, jabke technical concepts, role-play aur misaalon ko munazzam tarteeb mein rakha gaya hai. **Durustgi** ka matlab misleading baat ki correction hai. **Izafi study wazahat** ka matlab lecture se aagay samajhnay ke liye explanation hai. Is edition mein pehlay 30-minute extract ke bajaye lamba transcript istemal hua hai. Aakhri adhooray jumlay ki wazahat ab bhi darkar hai.

Original transcript ko alag source file ke taur par sambhal kar rakhein. Course PDFs aur pehlay chhotay class notes izafi sources hain.

<a id="section-2"></a>

## 2. Lecture Mein Topics Ki Tarteeb

| Waqt | Topic | Kya samajhna hai |
|---|---|---|
| 00:00:02–00:19:03 | Introductions aur background | Learning goals |
| 00:19:03–00:27:21 | Course approach aur certification discussion | Administration aur practice |
| 00:27:21–00:31:19 | Governance, storage, compute | Administrator ki responsibilities |
| 00:31:29–00:36:33 | Virtual desktops aur AVD | Local device aur remote desktop |
| 00:36:38–00:39:17 | Networking aur monitoring | Resources aur health |
| 00:39:24–00:42:04 | Physical se virtual aur cloud | Infrastructure ka safar |
| 00:42:21–00:48:22 | 15-server role-play | Requirements gathering |
| 00:48:29–00:55:01 | Customer ke sawalat | Cooling, power, rack aur disaster |
| 00:55:06–00:59:46 | Provider ke sawalat | Workload aur sizing |
| 00:59:46–01:03:15 | Security aur remote management | Access aur ownership |
| 01:03:18–01:08:17 | Private data center | Apne resources |
| 01:08:17–01:11:01 | CapEx aur OpEx | Kharchay ki sahi classification |
| 01:11:12–01:14:33 | Site selection aur shared facility | Risk aur tenancy |
| 01:14:41–01:23:41 | SLA aur priorities | Response aur resolution |

<a id="section-3"></a>

## 3. Seekhnay Ke Maqasid

Is lesson ke baad aap physical server, virtualization, cloud aur virtual desktop ka farq samjha sakein. 15 servers ki requirement par useful sawalat pooch sakein. Cooling, power, rack dependencies, security aur recovery ka basic maqsad bata sakein. CapEx/OpEx, resource group aur SLA ke uljhan paida karnay walay points ki durust wazahat kar sakein. Lecture ki misaal aur universal rule mein farq kar sakein.

<a id="section-4"></a>

## 4. Course ka maqsad aur certifications

**Lecture: 00:19:03–00:27:21.** Trainer ka focus fundamentals ke saath practical Azure administration hai: infrastructure configure, maintain aur support karna. Sirf portal ke buttons yaad karnay se aagay sochna hai ke design aisa kyun hai.

AZ-900, AZ-104 aur AZ-305 discuss huay. 00:19:39 ke qareeb AZ-400 ka caption course context se match nahin karta; audio verify karein. Course ko is caption ki wajah se AZ-400 na samjhein. Actual certification requirements official guide se check karein. L1/L2/L3 company ke roles hain; certificate job level ki guarantee nahin. AZ-900 ko sirf managers ya ek support level ke liye mehdood na samjhein.

00:22:21–00:22:29 mein trainer ne eight weeks ko correct karke six weeks kaha. Yeh us waqt bataya gaya plan hai; confirmed session calendar phir bhi lena chahiye kyun ke duration ke doosray hawalay wazeh nahin.

Aap ki Linux practice process, disk aur services mein madad karegi. VMware se host aur VM ka concept relate hoga. DNS aur Windows lab se identity aur name resolution connect hoga. Git se apne kaam ki history save hogi. Azure-specific configuration phir bhi alag seekhni hai.

<a id="section-5"></a>

## 5. Administration ke areas

**Lecture: 00:27:21–00:39:17.**

| Area | Bunyadi sawal |
|---|---|
| Identity aur governance | Kaun kya kar sakta hai aur kis qaiday ke tehat? |
| Storage | Data kahan aur kis tarah rakha jaye? |
| Compute | Workload ko kitni processing chahiye? |
| Networking | Systems ka secure rabta kaisay hoga? |
| Monitoring aur maintenance | Failure ya cost change ka pata kaisay chalega? |

**Durustgi:** governance sirf government regulation nahin. Organization ke access, policy, cost aur consistency controls bhi is mein aatay hain [S6][S6]. Lecture ke government-access aur countries ke dispute walay scenarios ko verified qanoon na samjhein. Yeh notes kisi country ke blanket legal access right ka dawa nahin kartay. Real project mein applicable rules aur agreements check hotay hain.

**Izafi study wazahat:** pehlay purpose aur requirements samjhein; phir design, configuration, verification aur operations par jayen. Workload samjhay baghair VM size chunna jaldi hogi.

<a id="section-6"></a>

## 6. Physical server, virtualization aur cloud

Physical server asal hardware machine hai. Is ke CPU, RAM, disks aur network interfaces hotay hain. Ownership aur contract ke mutabiq hardware, OS aur services manage hoti hain.

Virtualization mein hypervisor ek physical host par kai VMs chalata hai. VMs virtual CPU, memory, disk aur networking use karti hain. Physical host khatam nahin hota. Host fail ho to us par kai VMs affect ho sakti hain.

Cloud mein provider computing services provision karnay ke interfaces deta hai. Customer ki zimmedari service par depend karti hai. Azure VM par aap guest OS aur workload manage kar saktay hain; physical facilities provider ki taraf hoti hain.

On-premises environment bhi virtualized ho sakta hai. Sirf hardware rent karnay ya building share karnay se service automatically cloud nahin ban jati. Azure mein janay se reliability aur access planning ki zaroorat khatam nahin hoti.

<a id="section-7"></a>

## 7. AVD aur remote desktop

**Lecture: 00:31:29–00:36:33.** Local laptop se remote desktop khulta hai. Remote environment mein application chalti hai aur local device us ka interface dikhata hai.

**Durustgi:** AVD ka poora naam **Azure Virtual Desktop** hai, Azure Virtualization Desktop nahin. Microsoft isay Azure par desktop aur app virtualization service kehta hai [S1][S1]. VDI = Virtual Desktop Infrastructure. Trainer ne kaha ke detailed AVD is course ke main curriculum ka hissa nahin; yeh context ke liye discuss hua.

Har employee ka laptop identical hona ya support level ke mutabiq fixed specification milna universal rule nahin. Remote desktop har backend ke qareeb automatically nahin hota; yeh design par depend karta hai.

**Cost ki durustgi:** logout karnay se session-host VM automatically deallocate hona zaroori nahin. Stopped/allocated VM aur deallocated VM ki compute billing alag hoti hai. Deallocation ke baad bhi disks aur kuch network resources ki charges reh sakti hain [S2][S2]. Is liye “aaj kaam nahin kiya to aaj koi bill nahin” reliable rule nahin.

**Samajhnay ka sawal:** remote desktop ke andar khuli application kahan execute hoti hai? Remote session host par; local laptop client interface aur apne local tasks sambhalta hai.

<a id="section-8"></a>

## 8. Networking, resources aur monitoring

**Lecture: 00:36:38–00:39:17.** IP addressing, IPv4/IPv6, subnetting, CIDR, VLSM, supernetting, switching, routing aur firewall ka zikr aagay seekhnay wali bunyadon ke taur par hua. Is session ke transcript se in topics ka mukammal practical confirm nahin hota.

Resource aisa component ya service hai jisay manage kiya jata hai: VM, disk, virtual network ya storage account. **Azure resource group related resources ka logical container hai** [S3][S3]. Sirf kai servers ko resource group kehna definition nahin. Group mein mukhtalif resource types ho sakti hain.

Monitoring mein bill ke ilawa CPU, memory, disk, latency, service availability aur capacity dekhi jati hai. CPU 45% ya 99% ko akela dekh kar incident priority decide na karein. Duration, normal baseline, workload aur users par impact dekhein. Chand lamhon ka 99% CPU usage server hang honay ka yaqini saboot nahin.

<a id="section-9"></a>

## 9. Markazi role-play — customer ko 15 servers chahiye

**Lecture: 00:42:21–00:59:46.** Shared data-center provider ko 15 physical servers laganay ki request milti hai. Learners customer aur provider dono angles se sochtay hain. Maqsad server count ko seedha accept karnay ke bajaye requirements samajhna hai.

### Provider customer se kya poochay?

| Sawal | Wajah |
|---|---|
| Kaunsi business service ya application chalani hai? | Asal maqsad clear hota hai |
| 15 servers ki tadaad kis bunyad par tay ki? | Estimate ki bunyad samajh aati hai |
| CPU, RAM, disk aur network ki zaroorat kya hai? | Sizing aur performance |
| Peak usage aur future growth kitni hai? | Sirf aaj ke average par design na ho |
| Workloads ek doosray par kaisay depend kartay hain? | Failure chain samajh aati hai |
| Hardware customer dega ya provider? | Ownership aur billing |
| OS, patches, backup aur monitoring kaun karega? | Responsibility gaps band hotay hain |
| Remote access aur support kaisa chahiye? | Operations clear hoti hain |

Lecture mein domain controller, DNS, DHCP, file, print, database aur web roles ki misaalein aati hain. Analysis ke baad count kam ya zyada ho sakta hai. Yeh aap ke home lab ke liye 15 servers bananay ki instruction nahin.

**Durustgi:** “Kaunsi applications run hongi?” bilkul valid technical sawal hai. “Kaunsi services aur workloads run hongi?” bhi useful hai. Application lafz ko ghalat na samjhein. NGINX primarily web server/reverse proxy hai; PostgreSQL aur MongoDB ki tarah database engine nahin.

### Customer provider se kya poochay?

| Area | Sawal |
|---|---|
| Location | Kis facility mein servers hongay aur local risks kya hain? |
| Cooling | Equipment inlet conditions kaisay maintain aur monitor hoti hain? |
| Power | Alag power paths aur tested backup ka intizam hai? |
| Rack | Ek rack/PDU failure sab servers ko band kar sakti hai? |
| Disaster recovery | Site unavailable ho to service kaisay wapas aaye gi? |
| Physical access | Entry aur hardware work ka approval kis ke paas hai? |
| Remote access | Authentication, permissions aur logging kaisay hongi? |
| Support | Kaun response dega, kab aur kis commitment ke mutabiq? |
| Cost | Hardware, facilities, network aur support mein kya included hai? |

**Izafi study wazahat:** answers aur assumptions likhein. Sirf “15 servers chahiye” kehna purchase ya deployment ke liye mukammal specification nahin.

<a id="section-10"></a>

## 10. Cooling, power, racks aur failure domains

**Lecture: 00:48:29–00:55:01.** Cooling theek na ho to reliability aur availability affect ho sakti hai. Airflow aur environment monitor karna chahiye.

### Cooling Ki Wazahat

**Durustgi:** aam data center ko near-freezing ya minus temperature par rakhna normal requirement nahin. ASHRAE A1–A4 classes ke liye recommended equipment-inlet range **18–27°C** deta hai [S4][S4]. Yeh har equipment ke liye har jagah lagu honay wali room setting nahin; class aur manufacturer guidance bhi dekhein.

### Power Distribution

**PSU = Power Supply Unit**, Platform Service Unit nahin. **PDU = Power Distribution Unit**. PDU rack ke equipment mein power distribute karti hai. Enterprise PDU ko sirf ghar ke extension board ke barabar na samjhein.

### Mushtarka Failure Dependencies

**Failure domain:** mushtarka dependency ki wajah se kai components ek fault mein affect ho saktay hain. Host, rack, PDU, network path ya poori site shared dependency ho sakti hai. Lecture mein ek rack ke fault se 15 servers affect honay ki misaal hai.

**Izafi study wazahat:** do PSUs agar ek hi failed power path par lagi hon to independent-path protection nahin milti. Do racks mein servers rakhna tab useful hota hai jab application, network aur power design bhi continuity support karay. Backup data recovery ki copy hai; availability redundancy kuch failures ke bawajood service chalati hai; disaster recovery baray disruption ke baad restoration ka plan hai. Teeno ek doosray se related hain magar ek hi cheez nahin.

Azure availability options future lessons mein aayengi. Is physical example ko ordinary Azure VM ke liye exact rack choose karnay ki instruction na samjhein.

<a id="section-11"></a>

## 11. Security, ownership aur remote management

**Lecture: 00:59:46–01:03:15.** Shared facility mein ek customer ko doosray ke servers risk mein dalnay ka access nahin milna chahiye. Is liye controlled entry aur remote administration discuss hui.

Server ki ownership ka matlab yeh nahin ke poori facility mein baghair pabandi dakhil honay ki ijazat bhi mil gayi hai. Approved visits ki ijazat provider ke process ke mutabiq mil sakti hai. Escort, access list, cage aur maintenance window ka process provider aur agreement par depend karta hai. Kapron aur safai se mutalliq lecture ki misaalein har facility ki universal policy nahin hain.

**Izafi study wazahat:** likhein ke hardware work ka approval kaun dega, kaun perform karega, access log kahan hoga, patches kaun lagaye ga aur recovery ka owner kaun hai. Sirf “provider dekh lega” zimmedari ki kafi wazeh taqseem nahin.

<a id="section-12"></a>

## 12. Private aur shared data center

**Lecture: 01:03:18–01:14:33.** Private example mein organization apni zarooriyat ke liye apne resources rakhti hai. Shared example mein provider kai customers ko agreed arrangement se host karta hai.

| Term | Matlab |
|---|---|
| Private data center | Lecture mein apni organization ke liye dedicated environment |
| Shared/colocation facility | Kai customers ke equipment ya services ko host karna |
| Public cloud | Customers ko provider ki cloud services offer hona |
| Private cloud | Exclusive organizational use ka cloud; har server room private cloud nahin |

Trainer ne shared example ke liye public data center kaha. Isay public cloud ya publicly reachable servers ke saath confuse na karein.

Site selection mein flood, heat, earthquake, physical access restrictions aur environmental contamination discuss huay. Yeh investigate karnay ke risk categories hain; kisi named city ya provider ke bare mein verified judgement nahin.

<a id="section-13"></a>

## 13. CapEx aur OpEx — sahi explanation

**Lecture: 01:08:17–01:11:01.** Owned infrastructure mein investment aur ongoing services mein running costs hoti hain. Lekin lecture ka yeh rule ke business shuru honay ke baad har server purchase OpEx hai, durust nahin.

| Misaal | Bunyadi classification |
|---|---|
| Long-lived server asset khareedna | Aam tor par CapEx, baad mein bhi khareeda ho |
| Bijli aur routine operating services | Aam tor par OpEx |
| Recurring cloud usage | OpEx ki aam misaal |
| Agle saal aur hardware khareedna | Sirf baad ki purchase honay se OpEx nahin ban jata |

Microsoft business-case guidance capitalized assets aur running expenses mein farq karti hai aur baad ke saalon mein bhi capital spending model karti hai [S5][S5]. Expense ki nature aur applicable accounting policy matter karti hai; pehli ya baad ki payment hona akela rule nahin. Yeh study concept hai, company accounts ka faisla nahin.

On-premises mein CapEx aur OpEx dono hotay hain. Cloud hamesha sasta nahin; poori requirement, usage, support aur responsibilities compare karein.

<a id="section-14"></a>

## 14. SLA, priorities, response aur resolution

**Lecture: 01:14:41–01:23:41.**

**SLA = Service Level Agreement:** service commitments aur un ki measurement ka agreed bayan. **P = Priority**. Priority aur SLA ek hi cheez nahin; priority applicable target select karnay mein use ho sakti hai.

| Term | Matlab |
|---|---|
| **Response** | Muqarrar waqt mein ticket acknowledge karna ya us par kaam shuru karna |
| **Restoration** | Service ko dobara qabil-e-istemal halat mein lana |
| **Resolution** | Organization ke agreed process ke mutabiq issue hal karna |

Response ka matlab fault fix ho jana nahin. Workaround se service pehlay restore ho sakti hai aur permanent fix baad mein hota hai. Har target ki definition agreement se check karein.

### Lecture ki misaali timings — universal nahin

| Priority | Response | Transcript mein resolution ya due date |
|---|---|---|
| P1 | 5–10 minutes aur urgent call ka example | 30–60 minutes; last jumla adhoora |
| P2 | 10–15 minutes | Establish nahin hota |
| P3 | 15–30 minutes | Establish nahin hota |
| P4 | Taqreeban 30 minutes | Establish nahin hota |
| P5 | Taqreeban 30 minutes | Agreed due date; batch request example |

Purane short notes mein P2 2–3 hours, P3 1 din se 2–3 din, aur P4/P5 client-defined resolution likha hai. Naya transcript in sab timings ki tasdeeq nahin karta. P3 ki wording ab bhi unclear hai.

P5 mein takreeban 1,200 user accounts aane wali deadline se pehlay bananay ki misaal hai. Kai organizations isay service request kehti hain, incident nahin. Local process follow hota hai.

CPU percentage akeli P1 decide nahin karti; business impact, urgency, duration aur service health dekhein. Sirf SLA timer bachanay ke liye priority kam na karein. Transcript ke aakhir mein “decrease” ka adhoora lafz hai; us ka matlab andazay se complete nahin karna.

**Izafi misaal:** ticket 00:09:00 par aaya aur response target 10 minutes hai to 00:09:10 tak acknowledge karein. Agar restoration clock ticket creation se chalti hai aur target 60 minutes hai to deadline 00:10:00 hai. Actual agreement mein support hours aur clock definitions alag ho sakti hain.

<a id="section-15"></a>

## 15. Glossary

| Term | Matlab |
|---|---|
| Compute | Processing capacity |
| Workload | Application/service aur us ki resource zarooriyat |
| VM | Virtual Machine |
| Hypervisor | Hosts par VMs manage karnay wala platform |
| AVD | Azure Virtual Desktop |
| VDI | Virtual Desktop Infrastructure |
| Resource group | Related Azure resources ka logical container |
| Governance | Organizational rules aur controls |
| PSU | Power Supply Unit |
| PDU | Power Distribution Unit |
| Failure domain | Mushtarka dependency se affect honay wala boundary |
| CapEx | Capital Expenditure |
| OpEx | Operating Expenditure |
| SLA | Service Level Agreement |
| Restoration | Service ko acceptable working state mein wapas lana |
| Root cause | Asal sabab jis ki investigation se recurrence roki jaye |

<a id="section-16"></a>

## 16. Revision Checklist

- [ ] AVD, PSU aur PDU ke sahi full names yaad hain.

- [ ] Resource group sirf servers ka plural nahin.
- [ ] Baad mein khareeda hardware bhi CapEx ho sakta hai.

- [ ] Logout/shutdown se tamam cloud cost automatically zero nahin hoti.
- [ ] Normal data center ko freezing rakhna zaroori nahin.

- [ ] Application aur workload valid requirement terms hain.
- [ ] CPU percentage akeli incident priority decide nahin karti.

- [ ] Shared data center aur public cloud ek hi cheez nahin.
- [ ] Broad legal-access aur hiring claims ko independently verify karna hai.

<a id="section-17"></a>

## 17. Study ka order

Pehlay sections 6–8 parhein aur apnay alfaaz mein samjhayen. Phir 15-server case, cooling, security aur tenancy par jayen. Aakhir mein CapEx/OpEx aur SLA revise karein. Agar aap poora lesson bundle use kar rahe hain to us ki `Practice-and-Revision.md` file mein exercise aur sawalat hain. Neechay diye gaye sawalat in notes ke saath alag se bhi use kar saktay hain. Lecture mein Azure deployment lab confirm nahin; is lesson ka output requirements checklist aur explanation hai. Tracker mein apni practice ke baad status badlein.

### Apni Samajh Check Karein

1. Physical infrastructure, virtualization aur cloud mein kya farq hai?
2. 15 servers ki request accept karnay se pehlay kya poochna chahiye?
3. Kya alag racks mein servers ki koi dependency phir bhi mushtarka ho sakti hai?
4. Baad mein khareeda gaya hardware bhi CapEx kyun ho sakta hai?
5. Response, restoration aur resolution mein kya farq hai?

Pehlay jawab bol kar dein, phir relevant section dobara parhein.

<a id="section-18"></a>

## 18. Technical references

31 October 2026 ko check kiye gaye. Live lab ke waqt product behavior dobara check karein.

- [S1 — Azure Virtual Desktop](https://learn.microsoft.com/en-us/azure/virtual-desktop/overview)

- [S2 — VM states aur billing](https://learn.microsoft.com/en-us/azure/virtual-machines/states-billing)
- [S3 — Resource groups](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

- [S4 — ASHRAE data-center guidance](https://handbook.ashrae.org/Handbooks/A23/SI/A23_Ch20/a23_ch20_si.aspx)
- [S5 — Business-case cost classification](https://learn.microsoft.com/en-us/azure/migrate/concepts-business-case-calculation)

- [S6 — Azure governance](https://learn.microsoft.com/en-us/azure/governance/management-groups/azure-management)
- [Official AZ-104 guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104)

[S1]: https://learn.microsoft.com/en-us/azure/virtual-desktop/overview
[S2]: https://learn.microsoft.com/en-us/azure/virtual-machines/states-billing
[S3]: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal
[S4]: https://handbook.ashrae.org/Handbooks/A23/SI/A23_Ch20/a23_ch20_si.aspx
[S5]: https://learn.microsoft.com/en-us/azure/migrate/concepts-business-case-calculation
[S6]: https://learn.microsoft.com/en-us/azure/governance/management-groups/azure-management
