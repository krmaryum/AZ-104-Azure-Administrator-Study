# Home Broadband vs Dedicated Internet

**Language:** English  
**Context:** Day 01 follow-up — home networking, VMware labs, and business connectivity  
**Repository location:** `02-Topic-Notes/Networking/`

## 1. The Main Difference

Home broadband commonly shares capacity with other customers at parts of the provider's access or aggregation network. A Dedicated Internet Access (DIA) service provides dedicated or committed capacity within the scope defined in its agreement.

The useful comparison is **shared capacity versus committed capacity**, rather than simply a larger versus smaller advertised speed.

**Terminology:** a leased line can connect two private sites; it does not always include internet access. These notes compare home broadband with a leased-line-based or otherwise dedicated internet service. A business broadband plan is not automatically DIA. Ask which service is actually being supplied.

## 2. Comparison

| Feature | Home Broadband | Dedicated Internet / DIA |
|---|---|---|
| Capacity | Commonly shared at parts of the provider network | Dedicated or committed within the contracted service scope |
| Speed description | Advertised maximum, typical, or minimum figures depend on plan | Defined service rate and performance commitments |
| Upload/download | Can be asymmetric; some fiber plans are symmetric | Often symmetric |
| Busy hours | Congestion may affect throughput | Committed capacity is designed to make performance more predictable within the agreed scope |
| Support | Depends on the plan | Often includes business support and an SLA |
| Public addressing | Provider-dependent | Provider-dependent; static addresses may be included or optional |
| Cost | Usually lower | Usually higher; installation and contract terms vary |
| Remote websites | Their capacity and the internet path still matter | Their capacity and the internet path still matter |

These are common service characteristics, not universal product guarantees. Read the actual service description and SLA.

## 3. What Does Shared Bandwidth Mean?

Your home router serves your household. Further into the ISP network, traffic from several customers may use common infrastructure and capacity. When demand exceeds available capacity at a point, congestion can reduce throughput or increase delay.

A **500 Mbps plan** does not mean the complete path to every website has 500 Mbps reserved exclusively for you. Sharing also does not mean your connection must always be slow.

There are two separate sharing questions:

- **Inside your home:** your devices share your Wi-Fi, router resources, and internet subscription.
- **Inside the provider network:** customer traffic may share access or aggregation capacity.

**Important:** shared capacity does not mean other customers are authorized to view your private files. Network capacity sharing and access permissions are different concepts.

## 4. What Does Dedicated or Committed Mean?

A provider commits capacity and performance according to the agreement. A 100 Mbps symmetric DIA service may commit 100 Mbps in each direction across the defined service segment.

That does not mean every part of the public internet is a private cable reserved for your business. The provider's wider network can still use shared infrastructure engineered to meet commitments. Remote websites, transit paths, equipment, and protocols can limit actual application throughput.

Ask **between which points**, under which conditions, and by which measurement method the commitment applies. Do not interpret “guaranteed” as an unlimited guarantee for every destination.

## 5. Download, Upload, and Symmetry

The following numbers are learning examples, not your actual subscription:

| Example Connection | Download | Upload |
|---|---|---|
| Home broadband | 500 Mbps | 20 Mbps |
| Symmetric DIA | 100 Mbps | 100 Mbps |

- Downloading an ISO may benefit from the home plan's higher download capacity.
- Uploading a class recording may benefit from the DIA example's higher upload capacity.
- A 100/100 service has **100 Mbps per direction**, rather than 200 Mbps available for one download.
- Symmetric home fiber exists; equal upload/download speeds alone do not prove the service is dedicated.

**Remember:** compare both directions and the service commitment, not just the largest number.

## 6. Mbps vs MB/s

**Mbps** means megabits per second. **MB/s** means megabytes per second. There are 8 bits in a byte.

```text
Approximate MB/s = Mbps ÷ 8
100 Mbps ÷ 8 = 12.5 MB/s
20 Mbps ÷ 8 = 2.5 MB/s
```

These are ideal conversions before protocol overhead and other bottlenecks. A file download rate is not guaranteed to equal the converted line rate.

## 7. Bandwidth, Throughput, Latency, Jitter, and Loss

| Term | Meaning | Why It Matters |
|---|---|---|
| Bandwidth | Capacity of a connection or path segment | Upper capacity limit |
| Throughput | Rate actually achieved over a measurement period | Observed transfer performance |
| Latency | Time taken for communication to travel; ping normally reports round-trip time | Interactive applications and remote sessions |
| Jitter | Variation in delay | Calls and live classes |
| Packet loss | Packets that fail to reach their destination | Retransmissions, interruptions, and reduced performance |

High bandwidth does not automatically mean low latency. A larger plan cannot necessarily fix poor Wi-Fi coverage, an overloaded remote server, or packet loss elsewhere.

## 8. Examples from Your Home Lab

| Activity | Main Network Resources Used | Does It Normally Use Your ISP Internet Connection? |
|---|---|---|
| DNS01 talks to DNS02 on the same host-only VMware network | Host resources and virtual networking | No |
| Laptop copies a file to your desktop over the home LAN | Wi-Fi/Ethernet, local switching, device storage and CPU | No, assuming a local direct path |
| Watching a YouTube class | Home network, ISP service, and remote delivery infrastructure | Yes |
| Uploading a recording | Home network and ISP upload capacity | Yes |
| Managing an Azure VM from home | Home network, ISP service, and the remote network path | Yes, for the normal public-internet path |
| VM queries an external DNS server | Depends on VMware mode, routing, and destination | Usually yes if the destination is reached over the internet |

A local file transfer is not an internet speed test. Two VMs on the same host may exchange traffic without using the physical Wi-Fi adapter. Bridged, NAT, and host-only networking produce different paths.

## 9. SLA: What to Check

An SLA can define availability, response, restoration, and performance measures, with exclusions and remedies. Do not assume the same terms apply to every service.

Questions for the provider:

1. Is this business broadband, DIA, or a private point-to-point circuit?
2. What capacity is committed, and in which directions?
3. Where are the measurement endpoints?
4. What availability, latency, packet-loss, response, and restoration targets apply, if any?
5. What exclusions, maintenance windows, and remedies apply?
6. Are the router, static addressing, backup link, and support included?
7. What happens if the access circuit or provider site fails?

Dedicated capacity does not itself guarantee route diversity or eliminate outages. Resilience is a separate design decision.

## 10. A Simple Home Verification Exercise

This exercise measures your connection; it does not change router settings or require buying a different service.

1. Record your plan's stated download and upload rates.
2. Where practical, use a wired connection to separate Wi-Fi effects from internet performance.
3. Pause your own large transfers and note other household activity.
4. Test using the same service/server at different times, then compare with another endpoint if needed.
5. Record download, upload, latency, connection type, and time.
6. Compare local file transfers separately from internet tests.

[Cloudflare's home connection test](https://speed.cloudflare.com/) is one measurement option. Speed tests consume data and show performance to the chosen endpoint at that time. They do not prove the cause of a slowdown or validate an entire SLA.

| Time | Wi-Fi/Ethernet | Download Mbps | Upload Mbps | Latency ms | Notes |
|---|---|---|---|---|---|
| Morning |  |  |  |  |  |
| Evening |  |  |  |  |  |

Avoid diagnosing provider congestion from one result. Device limits, Wi-Fi interference, VPNs, traffic elsewhere at home, and test-server conditions can also matter.

## 11. Common Misunderstandings

- **“Shared means unsafe.”** Capacity sharing does not grant access to your files.
- **“Dedicated means every website is always fast.”** The full path and destination still matter.
- **“Business internet always means leased line.”** Business broadband and DIA are different service categories.
- **“Every leased line provides internet.”** Some connect private sites.
- **“Symmetric means dedicated.”** Residential fiber can also be symmetric.
- **“My Wi-Fi speed is my ISP speed.”** Local link capacity and internet service capacity are different.
- **“My VMware lab needs a leased line.”** Local VM learning does not inherently require DIA; evaluate actual remote workloads and requirements.

## 12. Recall Questions and Answers

1. **What is the main difference?** Shared access capacity versus dedicated/committed capacity within the agreement's scope.
2. **Why might a 100/100 service upload faster than 500/20?** It offers greater upload capacity in this example.
3. **Does a local laptop-to-desktop copy normally use the ISP?** No, when the path remains on your LAN.
4. **Does 100 Mbps equal 100 MB/s?** No; 100 Mbps is 12.5 MB/s before overhead.
5. **What does a speed test prove?** Observed performance to its endpoint at the time tested.
6. **Does a leased line always include internet?** No; check the service type.

## References

Provider examples illustrate the terminology; they are not your service contract or purchasing recommendations.

- [BT — Direct Internet Access](https://international.bt.com/products-services/secure-connectivity/direct-internet-access): a provider example of uncontended internet access.
- [Hyperoptic — Business leased line](https://www.hyperoptic.com/business-broadband/leased-line/): a provider example discussing dedicated symmetric access and symmetric broadband.
- [Cloudflare — Latency, bandwidth, and throughput](https://www.cloudflare.com/en-gb/learning/performance/glossary/what-is-latency/): performance terminology.
