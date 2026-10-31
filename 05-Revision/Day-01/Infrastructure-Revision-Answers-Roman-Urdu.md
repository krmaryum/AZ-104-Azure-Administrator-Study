# Infrastructure Foundations — Paanch Revision Sawalat Aur Jawabat

**Zaban:** Roman Urdu  
**Context:** VMware home lab aur Azure administration ki bunyadain  
**Suggested repository folder:** `05-Revision/`

## 1. Physical Infrastructure, Virtualization Aur Cloud Mein Kya Farq Hai?

| Term | Matlab | Aap Ke Environment Mein Misaal |
|---|---|---|
| **Physical infrastructure** | Asal hardware aur supporting facilities: CPU, RAM, disks, networking, power aur cooling | Aap ka desktop, laptop aur network equipment |
| **Virtualization** | Physical hardware par virtual computers chalana | VMware mein DNS01, DNS02 aur DNS03 VMs |
| **Cloud** | Zaroorat ke mutabiq computing resources aur services provision aur use karna | Azure mein VM ya storage account banana |

Cloud bhi physical hardware par chalta hai. Farq resources provide aur manage karnay ke model mein hai. Sirf VMs banana automatically cloud nahin hota.

**Yaad rakhein:** physical infrastructure hardware deti hai; virtualization virtual computers chalati hai; cloud computing services provide aur use karnay ka model deta hai.

## 2. 15 Servers Ki Request Accept Karnay Se Pehlay Kya Poochna Chahiye?

Sab se pehlay poochhein: **“Aap ko in servers se kaunsa kaam karwana hai, aur 15 servers ki tadaad kis bunyad par calculate ki?”**

Phir requirements clear karein:

- Kaunsi applications aur services chalengi?
- Kitnay users honge aur peak demand kitni hogi?
- Kitna CPU, RAM, storage capacity, storage performance aur network bandwidth chahiye?
- Kitni downtime acceptable hai? Backup aur recovery ka kya intizam chahiye?
- Security, access aur location ki requirements kya hain?
- Hardware, OS, patching aur monitoring kaun manage karega?
- Budget aur future growth kya hai?

Assessment ke baad hi pata chalega ke 15 servers munasib hain, kam chahiye ya zyada. Workload aur availability requirements final design par asar dalti hain.

**Yaad rakhein:** servers ki tadaad aur size chun'nay se pehlay workload samjhein.

## 3. Kya Alag Racks Mein Servers Ki Koi Dependency Phir Bhi Mushtarka Ho Sakti Hai?

**Ji haan.** Alag racks ke servers phir bhi ek hi:

- Upstream switch ya router.
- Power source ya UPS.
- Storage system.
- Cooling system.
- Building ya site.

par depend kar saktay hain.

**Misaal:** DNS01 Rack A mein aur DNS02 Rack B mein hai, lekin dono ka network ek hi upstream switch se guzarta hai. Switch fail ho jaye to dono ki connectivity affect ho sakti hai.

Alag racks hona poori independence ka saboot nahin. Poora dependency path aur application ka failure handle karnay ka tareeqa check karein.

**Yaad rakhein:** equipment alag jagah par ho sakta hai, magar us ki koi bunyadi dependency phir bhi mushtarka ho sakti hai.

## 4. Baad Mein Khareeda Gaya Hardware Bhi CapEx Kyun Ho Sakta Hai?

Kyun ke classification **purchase ki nature** par depend karti hai, sirf is par nahin ke purchase kab hui.

Agar company aglay saal ek server khareedti hai jo kai saal use hoga, to woh long-term asset hai aur applicable accounting policy ke mutabiq CapEx ho sakta hai.

| Kharcha | Aam Classification |
|---|---|
| Naya long-lived server khareedna | **CapEx — Capital Expenditure** |
| Bijli aur routine operating services | **OpEx — Operating Expenditure** |
| Recurring cloud consumption | **OpEx ki aam misaal** |

CapEx sirf business shuru karnay ka kharcha nahin hota. Baad mein equipment khareednay se woh automatically OpEx nahin ban jata. Actual accounting treatment applicable policy ke mutabiq hota hai.

**Yaad rakhein:** purchase ki tareekh se zyada asset aur kharchay ki qisam matter karti hai.

## 5. Response, Restoration Aur Resolution Mein Kya Farq Hai?

| Term | Matlab | Website Down Honay Ki Misaal |
|---|---|---|
| **Response** | Agreed process ke mutabiq incident acknowledge karke engagement shuru karna | “Ticket receive ho gaya; hum investigation kar rahe hain.” |
| **Restoration** | Service ko dobara qabil-e-istemal banana, zaroorat par workaround se | Traffic backup server par shift karke website chala dena |
| **Resolution** | Incident ko agreed process ke mutabiq hal karna aur outcome verify karna | Functionality confirm karke incident resolve karna |

Restoration permanent fix se pehlay ho sakti hai. Root-cause investigation aur permanent corrective work incident resolve honay ke baad **problem management** ke tehat jari reh saktay hain.

Agreement ki definitions check karein: response, restoration aur resolution targets ke clocks aur conditions alag ho saktay hain.

**Yaad rakhein:** response = kaam par lagna; restoration = service wapas chalana; resolution = agreed process ke mutabiq incident hal karna.

## Apni Samajh Check Karein

- [ ] Main physical infrastructure, virtualization aur cloud ko apne lab se samjha sakta hoon.
- [ ] Main design propose karnay se pehlay server request par useful sawalat pooch sakta hoon.
- [ ] Main alag racks ki mushtarka dependencies pehchan sakta hoon.
- [ ] Main samajhta hoon ke baad ki hardware purchase bhi CapEx kyun ho sakti hai.
- [ ] Main response, restoration aur resolution ka farq samjha sakta hoon.
