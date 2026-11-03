# Day 01 — Course Kickoff, Data-Center Foundations, and SLA

**Date:** 31 October 2026  
**Course:** AZ-104 — Microsoft Azure Administrator  
**Revision:** 3 — polished study edition  
**Recording:** [Day 01 — Course Kickoff and Orientation](https://youtu.be/9Jk06-FvvH8)

## Key Ideas at a Glance

| Topic | Point to remember |
|---|---|
| Requirements | Establish the workload before choosing server count or size. |
| Reliability | Identify shared power, rack, network, and site dependencies. |
| Responsibility | State who owns, manages, monitors, and restores each component. |
| Costs | Classify expenditure by its nature; check all continuing cloud charges. |
| SLA | Distinguish response, restoration, and resolution under the agreement. |

## Contents

- [1. Sources and How to Use These Notes](#section-1)
- [2. Lecture navigation](#section-2)
- [3. Learning objectives](#section-3)
- [4. Course purpose and certification discussion](#section-4)
- [5. The administration areas introduced](#section-5)
- [6. Physical servers, virtualization, and cloud](#section-6)
- [7. AVD and remote desktops](#section-7)
- [8. Networking, resources, and monitoring](#section-8)
- [9. Main case study — the customer requests 15 physical servers](#section-9)
- [10. Cooling, power, racks, and failure domains](#section-10)
- [11. Physical security, ownership, and remote management](#section-11)
- [12. Private and shared data centers](#section-12)
- [13. CapEx and OpEx](#section-13)
- [14. SLA, priority, response, and resolution](#section-14)
- [15. Glossary](#section-15)
- [16. Revision Checklist](#section-16)
- [17. Review and Practical Study](#section-17)
- [18. Technical References](#section-18)

<a id="section-1"></a>

## 1. Sources and How to Use These Notes

The supplied `Day-01-Complete-Transcript.txt` contains timestamped captions from **00:00:02 to 01:23:41**, covering almost the full displayed recording length of approximately 01:23:43. The final sentence, about issue resolution, is incomplete. The audio has not been independently checked, and some captions may contain transcription errors.

These notes organize the lecture into concepts, examples, and revision points. Introductions and repeated filler are condensed while the technical discussion and central role-play are retained. Two labels help distinguish the material:

- **Clarification:** a technical correction or a qualification needed for accuracy.

- **Study extension:** an additional explanation that develops the lecture topic.

The course PDFs and earlier short notes are supplementary sources.

Keep the original transcript as a separate source file. These notes use the longer transcript rather than the earlier 30-minute extract; the incomplete final sentence remains an open point.

<a id="section-2"></a>

## 2. Lecture navigation

Timestamps are approximate topic entry points from the supplied captions.

| Time | Topic | Study focus |
|---|---|---|
| 00:00:02–00:19:03 | Introductions and background | Learning goals and existing skills |
| 00:19:03–00:27:21 | Azure course approach and certification discussion | Administration, foundations, practical learning |
| 00:27:21–00:31:19 | Course areas, governance, storage, compute | What administrators manage |
| 00:31:29–00:36:33 | Virtual desktops and AVD | Endpoint versus remote desktop |
| 00:36:38–00:39:17 | Networking, resources, monitoring | Foundations and operating visibility |
| 00:39:24–00:42:04 | Infrastructure progression and outline | Physical, virtualized, and cloud approaches |
| 00:42:21–00:48:22 | 15-server role-play begins | Gather requirements before designing |
| 00:48:29–00:55:01 | Customer questions | Location, cooling, power, disasters, racks, support |
| 00:55:06–00:59:46 | Provider questions | Validate server count and workloads |
| 00:59:46–01:03:15 | Ownership, physical security, remote management | Define access and responsibility |
| 01:03:18–01:08:17 | Private data center and resources | Ownership, compute, network, storage |
| 01:08:17–01:11:01 | CapEx and OpEx | Correct expense classification |
| 01:11:12–01:14:33 | Site selection and shared facilities | Environmental risk and tenancy |
| 01:14:41–01:23:41 | SLA, priorities, response, resolution | Agreements and operational action |

<a id="section-3"></a>

## 3. Learning objectives

After studying this lesson, you should be able to:

- Explain why Azure learning benefits from infrastructure fundamentals.
- Distinguish physical infrastructure, virtualization, cloud, and virtual desktops.

- Ask useful customer and provider questions about a 15-server requirement.
- Explain cooling, power, rack dependencies, security, and disaster recovery at a basic level.

- Distinguish customer-owned equipment from provider-managed services.
- Correctly explain CapEx, OpEx, resource groups, and SLA terminology.

- Separate lecture examples from universal rules and unverified claims.

<a id="section-4"></a>

## 4. Course purpose and certification discussion

**Lecture: approximately 00:19:03–00:27:21.** The trainer describes a course combining fundamentals with practical Azure administration. The emphasis is on system operations: configuring, maintaining, and supporting infrastructure. Learners are encouraged to understand why a system is designed a certain way instead of following portal clicks alone.

The transcript discusses AZ-900, AZ-104, and AZ-305. A reference to AZ-400 around 00:19:39 conflicts with the course identity and should be checked against audio. Treat that caption as an unresolved mismatch with the course title. Use the official exam outline when checking certification requirements; support labels such as L1, L2, and L3 describe responsibilities that vary by employer. A certification alone does not establish a job level. AZ-900 should be understood as a fundamentals topic rather than a qualification restricted to one support level or to managers.

The trainer corrects eight weeks to six weeks around 00:22:21–00:22:29, but other duration figures are inconsistent. Six weeks is the stated intention at that point, not a confirmed published calendar. Ask for actual session dates.

### Connecting your existing practice

Linux helps with process, disk, access, and service troubleshooting. VMware helps explain virtual machines and shared hosts. DNS and Windows Server practice help with name resolution and identity. Git helps record what you configured and verified. These connections support learning; they do not replace Azure-specific practice.

<a id="section-5"></a>

## 5. The administration areas introduced

**Lecture: approximately 00:27:21–00:39:17.**

| Area | What to understand | Example question |
|---|---|---|
| Identity and governance | Who can act and which rules apply | Who may create resources? |
| Storage | How data is retained and accessed | Where is application data stored? |
| Compute | Workloads using processing capacity | Does the workload need a VM? |
| Networking | How systems connect securely | Which systems may communicate? |
| Monitoring and maintenance | Health, performance, cost, recovery | How will we notice a failure? |

**Clarification:** governance is broader than government regulation. It includes organizational policy, resource consistency, access, cost, and compliance controls [S6][S6]. The lecture’s geopolitical and government-access examples have not been verified. For an actual project, establish the applicable regulatory and contractual requirements rather than relying on a classroom scenario.

**Study extension:** follow this sequence: **purpose → requirements → design → configuration → verification → operations**. Beginning with a VM size before understanding a workload skips essential information.

<a id="section-6"></a>

## 6. Physical servers, virtualization, and cloud

**Lecture themes: 12-minute background discussion, 00:22:38, and 00:40:59–00:41:22.**

| Approach | Description | Responsibilities to consider |
|---|---|---|
| Physical server | Workload runs on a dedicated physical machine | Hardware lifecycle, facilities, OS and workload management according to contract |
| Virtualization | Hypervisor runs multiple VMs on physical hosts | Host capacity and VM dependencies |
| Cloud | Provider delivers computing services through service interfaces | Customer configuration, workload, access and data responsibilities depend on service |

An on-premises system can be virtualized. Cloud also depends on physical infrastructure. Renting servers or sharing a building alone does not establish that a service is cloud computing.

**Example:** your VMware VMs share a physical host. A host failure can affect several VMs at once. Moving to Azure changes the management model and responsibility boundary; it does not remove the need to plan for reliability.

<a id="section-7"></a>

## 7. AVD and remote desktops

**Lecture: 00:31:29–00:36:33.** The trainer describes staff using local laptops to connect to remote desktop environments running near organizational workloads. A local device displays the session while remote systems execute the workload.

**Clarification:** AVD means **Azure Virtual Desktop**, not Azure Virtualization Desktop. Microsoft describes it as a desktop and application virtualization service on Azure [S1][S1]. VDI means Virtual Desktop Infrastructure. AVD is discussed here as context; the trainer explicitly says it is outside this course's main curriculum.

Do not assume every employee gets identical hardware, that a support level fixes laptop specifications, or that every AVD deployment is near every backend workload. Those are organizational/design choices.

**Cost clarification:** a user signing out does not automatically mean the session-host VM is deallocated. Azure VM stopped/allocated and deallocated states have different compute billing behavior. Disks and some network resources can continue costing money after deallocation [S2][S2]. Therefore “not working today means no charges today” is not a reliable rule.

**Study check:** which computer executes an application inside a remote desktop? The remote session host, while the local laptop handles the client interface and other local tasks.

<a id="section-8"></a>

## 8. Networking, resources, and monitoring

**Lecture: 00:36:38–00:39:17.** The trainer lists IP addressing, IPv4/IPv6, subnetting, CIDR, VLSM, supernetting, virtual networking, routing, switching, and firewalls as foundations to learn. These are introductions to future study, not completed networking labs in this session.

A resource is a managed infrastructure component or service. Examples include a VM, disk, virtual network, or storage account. **An Azure resource group is a logical container for related resources** [S3][S3]. A collection of servers alone is not the definition of a resource group. A group can contain several resource types.

Monitoring is broader than checking a bill. Distinguish:

- **Performance:** CPU, memory, disk usage, latency.
- **Availability:** whether a service is reachable and working.

- **Capacity:** whether resources can meet demand.
- **Cost:** what usage is being charged and why.

A CPU reading is a signal to interpret. Compare its duration, baseline, workload, and user impact before deciding severity. A short 99% burst does not prove a server will hang, and 45% is not a universal incident threshold.

<a id="section-9"></a>

## 9. Main case study — the customer requests 15 physical servers

**Lecture: 00:42:21–00:59:46.** A shared-data-center provider receives a request to install 15 servers. Learners alternate customer and provider perspectives. The point is to discover requirements, dependencies, and responsibilities before accepting the number as the design.

### 9.1 Questions the provider should ask

| Question | Why it matters |
|---|---|
| What business service or application must run? | Establishes purpose and success criteria |
| Why 15 servers? | Tests whether the estimate has evidence |
| What are CPU, RAM, storage and network needs? | Informs sizing and performance |
| What are peak demand and expected growth? | Avoids planning only for today's average |
| Which workloads depend on each other? | Reveals failure chains |
| Who supplies the hardware? | Clarifies ownership and charging |
| Who installs, patches, backs up and monitors? | Prevents gaps in responsibility |
| What access and support are needed? | Defines operations |

The lecture names domain controllers, DNS, DHCP, file, print, database, and web servers as possible roles. Analysis might justify fewer or more servers. The numbers in the discussion illustrate sizing decisions; they are not requirements for your home lab.

**Clarification:** asking “Which applications will run?” is valid technical language. “Which services and workloads will run?” is also useful. Both terms are useful when describing requirements. NGINX is primarily web-server/reverse-proxy software; it is not a database engine like PostgreSQL or MongoDB.

### 9.2 Questions the customer should ask

| Area | Useful questions |
|---|---|
| Location | Which facility hosts the systems, and what risks affect it? |
| Cooling | How are equipment inlet conditions monitored and maintained? |
| Power | Are there independent feeds, redundant equipment and tested backup arrangements? |
| Rack placement | Could one rack or PDU failure affect everything? |
| Disaster recovery | How will service return if the site is unavailable? |
| Physical access | Who can enter, approve work and handle hardware? |
| Remote access | How are administrators authenticated and their actions controlled? |
| Support | Who responds, when, through which channel, under what commitment? |
| Costs | Which facilities, hardware, network and support charges are included? |

**Study extension:** record answers and open assumptions. A request for 15 servers is not enough information to buy or deploy them responsibly.

<a id="section-10"></a>

## 10. Cooling, power, racks, and failure domains

**Lecture: 00:48:29–00:55:01.**

### Cooling

**Cooling:** inadequate cooling can affect hardware reliability and availability. Temperature, airflow and environmental conditions need appropriate design and monitoring. Near-freezing or below-freezing air is not a general requirement for ordinary server rooms. ASHRAE lists a recommended equipment-inlet temperature range of **18–27°C for classes A1–A4** [S4][S4]. This is not a mandatory room setting for all equipment; use the applicable class, manufacturer requirements and full environmental guidance.

### Power Distribution

**Power:** a server needs working power paths. **PSU means Power Supply Unit.** The wording “Platform Service Unit” in the supplied transcript is incorrect. **PDU means Power Distribution Unit**. A rack PDU distributes power to equipment. Use the term **PDU** when discussing rack power distribution; enterprise equipment may have capabilities beyond those of a household extension board.

### Shared Failure Dependencies

**Failure domain:** components can fail together because they share a dependency. A single host, rack, PDU, network path, or site can form such a dependency. The lecture illustrates how all 15 servers in one rack might be affected by a common power fault.

**Study extension:** two PSUs connected to one failed power path do not provide independent-path protection. Spreading servers between racks helps only if application redundancy and the underlying power/network design also support continuity. Backup is a recoverable data copy; availability redundancy keeps service operating through some failures; disaster recovery plans restoration after larger disruptions. These are related but different goals.

**Azure connection:** later lessons will examine availability options. Do not interpret this physical-rack example as instructions to choose exact physical racks for ordinary Azure VMs.

<a id="section-11"></a>

## 11. Physical security, ownership, and remote management

**Lecture: 00:59:46–01:03:15.** The trainer explains why shared facilities restrict access: one customer must not endanger another customer's equipment. Remote administration is discussed as an alternative to routine physical attendance.

**Clarification:** owning a server does not automatically authorize unrestricted access to every part of a shared facility. Approved customer visits may still be permitted. Escorts, approved maintenance windows, cages, access lists and contractual procedures vary. Clothing and cleanliness procedures also depend on the facility; the anecdote is not a universal policy.

**Study extension:** document who authorizes a hardware change, who performs it, how access is logged, who patches the OS, and who owns recovery. “The provider manages it” is too vague without named responsibilities.

<a id="section-12"></a>

## 12. Private and shared data centers

**Lecture: 01:03:18–01:14:33.** The private-data-center example uses an organization's resources for its own needs. The shared example accommodates multiple customers under provider conditions.

| Term in these notes | Meaning |
|---|---|
| Private data center | Facility/environment dedicated to an organization's own requirements in the lecture example |
| Shared or colocation facility | Hosts equipment or services for multiple customers under an agreement |
| Public cloud | Provider's cloud services offered to customers; not synonymous with a shared building |
| Private cloud | Cloud environment for exclusive organizational use; not every private server room qualifies |

The trainer says “public data center” for the shared-facility example. Preserve the intended tenancy idea without confusing it with public cloud or publicly accessible servers. Ownership and access rights should be established in the contract.

Site-selection examples mention floods, heat, earthquakes, access restrictions, and contamination from nearby environments. Treat these as risk categories to investigate. They do not establish that any named city or commercial provider is unsuitable.

<a id="section-13"></a>

## 13. CapEx and OpEx

**Lecture: 01:08:17–01:11:01.** The intended lesson is that owned infrastructure requires investment, while ongoing services create running costs. An important correction is needed: buying additional servers after a business has started does not automatically make the purchase OpEx.

| Example | Typical study classification |
|---|---|
| Purchase of a long-lived server asset | Typically CapEx, even after the business has started |
| Electricity, routine operating services | Typically OpEx |
| Recurring cloud consumption | Common OpEx example |
| Purchase of more hardware next year | Not automatically OpEx because it is a later purchase |

Microsoft's business-case guidance distinguishes capitalized asset investment from running expenses and models capital spending in later years too [S5][S5]. Classification depends on the nature of expenditure and applicable accounting policy, not simply first purchase versus later purchase. Use this distinction to understand infrastructure costs; actual accounting treatment follows the organization’s applicable policy.

**Study extension:** an on-premises data center has both capital and operating expenses. Cloud is not automatically cheaper. Compare the entire service requirement, usage, support and retained responsibilities.

<a id="section-14"></a>

## 14. SLA, priority, response, and resolution

**Lecture: 01:14:41–01:23:41.**

**SLA = Service Level Agreement.** It records agreed service commitments and how they are measured. **P means Priority** in the incident examples. Priority and an SLA are related but are not interchangeable words: the priority can determine the applicable response/restoration target.

| Term | Meaning |
|---|---|
| **Response** | Acknowledging the ticket or beginning engagement within the agreed interval |
| **Restoration** | Returning the affected service to an acceptable operating state |
| **Resolution** | Resolving the issue according to the organization’s agreed process |

A response does not mean the fault has been fixed. Service may be restored through a workaround before a permanent fix is completed. Check how the agreement defines each target.

### Lecture examples — not universal commitments

| Priority | Response described | Resolution or due date in the supplied transcript |
|---|---|---|
| P1 | 5–10 minutes, plus an urgent call in the example process | 30–60 minutes; discussion ends mid-sentence |
| P2 | 10–15 minutes | Not established in this transcript |
| P3 | 15–30 minutes | Not established in this transcript |
| P4 | Around 30 minutes | Not established in this transcript |
| P5 | Around 30 minutes | Agreed due date; batch request example |

The earlier short notes also record P2 resolution of 2–3 hours, P3 wording of 1 day to 2–3 days, and client-defined P4/P5 targets. Those values are supplementary note entries, not confirmed by this transcript. P3 wording remains unclear.

The P5 example is creating about 1,200 user accounts for a future deadline. Many organizations handle such work as a service request rather than an incident. The correct classification follows the organization's process.

The lecture's urgent CPU scenario teaches prompt engagement. **Clarification:** the metric alone does not determine P1. Judge business impact, urgency, duration, service health and the incident policy. Do not lower a priority solely to meet a timer. The last word of the transcript appears to begin a “decrease” discussion; its meaning is incomplete and should not be reconstructed.

**Study extension — example timeline:** a ticket arrives at 00:09:00; a 10-minute response target means acknowledgment by 00:09:10. If a restoration target is measured from ticket creation and is 60 minutes, its deadline is 00:10:00. Actual agreements may define clocks, support hours and exclusions differently. Always read the definitions.

<a id="section-15"></a>

## 15. Glossary

| Term | Meaning |
|---|---|
| Compute | Processing capacity used by workloads |
| Workload | Application or service and its resource needs |
| VM | Virtual Machine |
| Hypervisor | Software/platform managing virtual machines on hosts |
| AVD | Azure Virtual Desktop |
| VDI | Virtual Desktop Infrastructure |
| Resource | A managed infrastructure component or service|
| Resource group | Azure logical container for related resources |
| Governance | Organizational rules and controls over resources and operations |
| PSU | Power Supply Unit |
| PDU | Power Distribution Unit |
| Failure domain | Shared dependency boundary within which failures may affect multiple components |
| CapEx | Capital Expenditure |
| OpEx | Operating Expenditure |
| SLA | Service Level Agreement |
| Priority | Relative urgency/importance under an agreed process |
| Restoration | Returning service to an acceptable operating state |
| Root cause | Underlying cause investigated to prevent recurrence |

<a id="section-16"></a>

## 16. Revision Checklist

- [ ] AVD is Azure Virtual Desktop.

- [ ] PSU is Power Supply Unit; PDU is Power Distribution Unit.
- [ ] A resource group is not merely several servers.

- [ ] Later hardware asset purchases can still be CapEx.
- [ ] Logging out or stopping an OS is not a guarantee of zero cloud charges.

- [ ] A normal data center does not require a freezing room.
- [ ] Application/workload are valid words when gathering requirements.

- [ ] CPU percentage alone does not establish incident priority.
- [ ] A shared data center is not automatically public cloud.

- [ ] Generalized legal-access and hiring claims need independent verification.

<a id="section-17"></a>

## 17. Review and Practical Study

If you are using the full lesson bundle, its `Practice-and-Revision.md` contains a planning exercise, open-ended questions, and answer guidance. You can also use the questions below independently. No Azure deployment was demonstrated in the supplied transcript. This lesson's practical outcome is a requirements checklist and explanation, rather than a cloud deployment.

Recommended order: read sections 6–8; explain them aloud; study the 15-server case in sections 9–12; finish costs and SLA in sections 13–14. Update the progress tracker only after your own review and practice.

### Self-Check Questions

1. How do physical infrastructure, virtualization, and cloud differ?
2. What would you ask before accepting a request for 15 servers?
3. Could two servers in different racks still share a failure dependency?
4. Why can a later hardware purchase still be CapEx?
5. How do response, restoration, and resolution differ?

Try answering aloud before reviewing the relevant section.

- [Answers](Revision/Infrastructure-Revision-Answers-English.md)

<a id="section-18"></a>

## 18. Technical References

References checked 31 October 2026. Recheck product behavior when doing a live lab.

- [S1 — Azure Virtual Desktop overview](https://learn.microsoft.com/en-us/azure/virtual-desktop/overview)

- [S2 — VM states and billing](https://learn.microsoft.com/en-us/azure/virtual-machines/states-billing)
- [S3 — Resource groups](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

- [S4 — ASHRAE: Data centers and telecommunications facilities](https://handbook.ashrae.org/Handbooks/A23/SI/A23_Ch20/a23_ch20_si.aspx)
- [S5 — Azure Migrate business-case calculation](https://learn.microsoft.com/en-us/azure/migrate/concepts-business-case-calculation)

- [S6 — Azure management and governance](https://learn.microsoft.com/en-us/azure/governance/management-groups/azure-management)
- [Official AZ-104 study guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104)

[S1]: https://learn.microsoft.com/en-us/azure/virtual-desktop/overview
[S2]: https://learn.microsoft.com/en-us/azure/virtual-machines/states-billing
[S3]: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal
[S4]: https://handbook.ashrae.org/Handbooks/A23/SI/A23_Ch20/a23_ch20_si.aspx
[S5]: https://learn.microsoft.com/en-us/azure/migrate/concepts-business-case-calculation
[S6]: https://learn.microsoft.com/en-us/azure/governance/management-groups/azure-management
