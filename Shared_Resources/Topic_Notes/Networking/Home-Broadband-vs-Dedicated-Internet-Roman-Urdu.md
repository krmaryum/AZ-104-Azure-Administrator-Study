# Home Broadband Aur Dedicated Internet Ka Farq

**Zaban:** Roman Urdu  
**Context:** Day 01 follow-up — home networking, VMware lab aur business connectivity  
**Repository location:** `Shared_Resources/Topic_Notes/Networking/`

## 1. Asal Farq

Home broadband mein provider ke access ya aggregation network ke kuch hisson ki capacity aam tor par doosray customers ke saath shared hoti hai. Dedicated Internet Access (DIA) mein provider agreement ke mutabiq dedicated ya committed capacity deta hai.

Asal comparison **shared capacity aur committed capacity** ka hai; sirf baray aur chhotay advertised number ka nahin.

**Terminology:** leased line do private sites ko bhi connect kar sakti hai; internet access har leased line ka lazmi hissa nahin. In notes mein home broadband ko dedicated internet service se compare kiya gaya hai. Business broadband ka naam honay se service automatically DIA nahin ban jati.

## 2. Comparison

| Feature | Home Broadband | Dedicated Internet / DIA |
|---|---|---|
| Capacity | Provider network ke kuch hisson par shared | Contract ke defined scope mein dedicated ya committed |
| Speed description | Maximum, typical ya minimum figures plan par depend kartay hain | Defined service rate aur performance commitments |
| Upload/download | Mukhtalif ho saktay hain; kuch fiber plans symmetric hain | Aksar symmetric |
| Busy hours | Congestion se throughput affect ho sakti hai | Agreed scope mein performance zyada predictable bananay ka intizam |
| Support | Plan ke mutabiq | Aksar business support aur SLA |
| Public addressing | Provider par depend karta hai | Static addresses included ya optional ho saktay hain |
| Cost | Aam tor par kam | Aam tor par zyada; installation aur contract terms alag hoti hain |
| Remote websites | Un ki capacity aur network path matter kartay hain | Un ki capacity aur network path phir bhi matter kartay hain |

Yeh aam characteristics hain, har product ki guarantee nahin. Actual service description aur SLA dekhein.

## 3. Shared Bandwidth Ka Matlab

Ghar ka router aap ke household ko serve karta hai. ISP ke network mein aagay kai customers ka traffic common infrastructure aur capacity use kar sakta hai. Jab kisi point par demand capacity se zyada ho to congestion se transfer slow ya delay zyada ho sakta hai.

**500 Mbps plan** ka matlab yeh nahin ke har website tak poora rasta 500 Mbps par sirf aap ke liye reserved hai. Sharing ka matlab yeh bhi nahin ke speed har waqt kam hogi.

Sharing ke do alag pehlu hain:

- **Ghar ke andar:** devices Wi-Fi, router resources aur internet subscription share kartay hain.
- **Provider ke network mein:** customers access ya aggregation capacity share kar saktay hain.

**Important:** shared capacity ka matlab doosray customers ko aap ki private files dekhnay ki ijazat milna nahin. Capacity aur access permissions alag concepts hain.

## 4. Dedicated Ya Committed Ka Matlab

Provider agreement ke mutabiq capacity aur performance commit karta hai. Misaal ke taur par 100 Mbps symmetric DIA mein defined segment par har direction ki 100 Mbps capacity commit ho sakti hai.

Is ka matlab poora public internet aap ke liye private cable nahin. Provider ke wider network mein shared infrastructure ho sakti hai jo commitments fulfill karnay ke liye engineer ki gayi ho. Remote website, transit path, equipment aur protocols actual application throughput limit kar saktay hain.

Poochhein: guarantee **kin points ke darmiyan**, kin conditions mein aur kis measurement se apply hoti hai? Har destination ki unlimited guarantee assume na karein.

## 5. Download, Upload Aur Symmetry

Neechay numbers sirf misaal hain, aap ke actual plan ki settings nahin:

| Connection Ki Misaal | Download | Upload |
|---|---|---|
| Home broadband | 500 Mbps | 20 Mbps |
| Symmetric DIA | 100 Mbps | 100 Mbps |

- ISO download mein pehlay plan ki zyada download capacity faida de sakti hai.
- Recording upload mein doosray plan ki zyada upload capacity faida de sakti hai.
- 100/100 ka matlab har direction mein 100 Mbps hai; ek download ke liye 200 Mbps nahin.
- Symmetric home fiber bhi milti hai. Equal speeds dedicated service ka akela saboot nahin.

**Yaad rakhein:** dono directions aur service commitment compare karein.

## 6. Mbps Aur MB/s

**Mbps:** megabits per second. **MB/s:** megabytes per second. Ek byte mein 8 bits hoti hain.

```text
Approximate MB/s = Mbps ÷ 8
100 Mbps ÷ 8 = 12.5 MB/s
20 Mbps ÷ 8 = 2.5 MB/s
```

Yeh overhead aur doosri bottlenecks se pehlay ideal conversion hai. File transfer ki actual rate is se kam ho sakti hai.

## 7. Bandwidth, Throughput, Latency, Jitter Aur Loss

| Term | Matlab | Ahmiyat |
|---|---|---|
| Bandwidth | Connection ya path segment ki capacity | Upper capacity limit |
| Throughput | Measurement ke dauran hasil honay wali actual rate | Transfer ka observed result |
| Latency | Communication ka travel delay; ping aam tor par round-trip time batata hai | Remote sessions aur interactive work |
| Jitter | Delay mein tabdeeli | Calls aur live classes |
| Packet loss | Packets ka destination tak na pohanchna | Retransmissions aur interruptions |

Zyada bandwidth se latency automatically kam nahin hoti. Bara internet plan poor Wi-Fi coverage, remote server overload ya doosri jagah ki packet loss lazmi fix nahin karta.

## 8. Aap Ke Home Lab Ki Misaalein

| Activity | Main Resources | Kya Aam Tor Par ISP Internet Use Hota Hai? |
|---|---|---|
| DNS01 se DNS02, same host-only VMware network | Host aur virtual networking | Nahin |
| Laptop se desktop, local LAN par file copy | Wi-Fi/Ethernet, switching, storage aur CPU | Nahin, agar path local ho |
| YouTube class dekhna | Home network, ISP aur remote delivery infrastructure | Haan |
| Recording upload karna | Home network aur ISP upload capacity | Haan |
| Ghar se Azure VM manage karna | Home network, ISP aur remote path | Normal public-internet path mein haan |
| VM se external DNS query | VMware mode, routing aur destination par depend | Internet par destination ho to aam tor par haan |

Local file copy internet speed test nahin. Same host ki VMs physical Wi-Fi use kiye baghair communicate kar sakti hain. Bridged, NAT aur host-only mein paths alag ho saktay hain.

## 9. SLA Mein Kya Check Karein?

SLA availability, response, restoration aur performance measurements define kar sakta hai. Exclusions aur remedies bhi ho sakti hain. Har service ki terms ek jaisi assume na karein.

Provider se sawalat:

1. Yeh business broadband, DIA ya private point-to-point circuit hai?
2. Kitni capacity aur kis direction mein committed hai?
3. Measurement endpoints kahan hain?
4. Availability, latency, packet loss, response aur restoration ke kaun se targets hain, agar hain?
5. Maintenance windows, exclusions aur remedies kya hain?
6. Router, static addressing, backup link aur support included hain?
7. Access circuit ya provider site fail ho to kya hoga?

Dedicated capacity route diversity ya outage-free service ki guarantee nahin. Resilience ke liye alag design chahiye.

## 10. Ghar Par Simple Verification

Yeh measurement exercise hai; router settings badalna ya nayi service khareedna zaroori nahin.

1. Plan ki stated download aur upload rates likhein.
2. Mumkin ho to wired connection use karke Wi-Fi ka asar alag karein.
3. Apne baray transfers pause karein aur household activity note karein.
4. Same service/server par mukhtalif waqt test karein. Zaroorat par doosray endpoint se compare karein.
5. Download, upload, latency, connection type aur time record karein.
6. Local transfer aur internet results alag compare karein.

[Cloudflare connection test](https://speed.cloudflare.com/) ek measurement option hai. Speed test data consume karta hai aur us waqt selected endpoint ki performance dikhata hai. Ek result slowdown ki asal wajah ya poora SLA prove nahin karta.

| Waqt | Wi-Fi/Ethernet | Download Mbps | Upload Mbps | Latency ms | Notes |
|---|---|---|---|---|---|
| Subah |  |  |  |  |  |
| Shaam |  |  |  |  |  |

Ek result se provider congestion ka faisla na karein. Device limits, Wi-Fi interference, VPN, ghar ki doosri traffic aur test server bhi asar dal saktay hain.

## 11. Aam Ghalat Fehmiyan

- **Shared ka matlab unsafe:** capacity sharing private files ka access nahin deti.
- **Dedicated mein har website fast:** poora path aur destination phir bhi matter kartay hain.
- **Business internet hamesha leased line:** business broadband aur DIA alag categories hain.
- **Har leased line internet deti hai:** kuch private sites ko connect karti hain.
- **Symmetric ka matlab dedicated:** home fiber bhi symmetric ho sakti hai.
- **Wi-Fi speed hi ISP speed:** local link aur internet capacity alag hain.
- **VMware lab ke liye leased line lazmi hai:** local VM learning ke liye DIA inherently required nahin; actual workload aur remote requirements dekhein.

## 12. Revision Sawalat Aur Jawabat

1. **Asal farq?** Shared access capacity aur agreement ke scope mein dedicated/committed capacity.
2. **100/100 service 500/20 se upload mein tez kyun ho sakti hai?** Is misaal mein upload capacity zyada hai.
3. **Local laptop-to-desktop copy ISP use karti hai?** Nahin, jab path LAN ke andar rehta hai.
4. **100 Mbps, 100 MB/s hai?** Nahin; overhead se pehlay 12.5 MB/s hai.
5. **Speed test kya batata hai?** Us waqt selected endpoint tak observed performance.
6. **Har leased line mein internet hota hai?** Nahin; actual service type check karein.

## References

Provider examples terminology samajhnay ke liye hain; yeh aap ka service contract ya buying recommendation nahin.

- [BT — Direct Internet Access](https://international.bt.com/products-services/secure-connectivity/direct-internet-access): uncontended internet access ki provider misaal.
- [Hyperoptic — Business leased line](https://www.hyperoptic.com/business-broadband/leased-line/): dedicated symmetric access aur symmetric broadband ki wazahat.
- [Cloudflare — Latency, bandwidth aur throughput](https://www.cloudflare.com/en-gb/learning/performance/glossary/what-is-latency/): performance terms.
