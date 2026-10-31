# Day 01 — Practice and Revision

## Purpose / Maqsad
Turn the 15-server classroom scenario into a requirements document. Yeh planning exercise hai; Azure resource deploy karna zaroori nahin. Do not mark a cloud lab complete from this worksheet.

## Part A — Customer and provider roles
Scenario: a customer requests 15 physical servers at a shared facility. No workload measurements or availability commitments have yet been supplied.

Complete the table with questions and assumptions. Unknown is a valid answer; invented sizing is not evidence.

| Area | Customer requirement | Provider question | Evidence needed | Still unknown |
|---|---|---|---|---|
| Workloads/services |  |  |  |  |
| CPU and RAM |  |  |  |  |
| Storage capacity/performance |  |  |  |  |
| Network and dependencies |  |  |  |  |
| Peak use/growth |  |  |  |  |
| Site/environment |  |  |  |  |
| Power and rack dependencies |  |  |  |  |
| Ownership and physical access |  |  |  |  |
| Remote administration |  |  |  |  |
| Backup and recovery |  |  |  |  |
| Monitoring and support |  |  |  |  |
| Costs and agreement |  |  |  |  |

### Example completed row — study extension
Workload: customer wants a business website. Provider asks about peak concurrency, response-time goals and database dependencies. Evidence: existing performance measurements or a load-test plan. Unknown: required server count until assessment. This is an example, not a measured requirement for the learner's project.

## Part B — Failure scenarios / Failure par sochna
1. All 15 servers share one PDU. What might happen if it fails?
2. Servers are in two racks but share one upstream network device. What dependency remains?
3. A customer owns hardware but requests unrestricted facility access. What should be checked?
4. A session-host user signs out. What must you verify before making a cost claim?
5. CPU reaches 99% for a few seconds without user impact. What additional facts do you need before setting incident priority?

### Answer direction
1. Multiple/all connected servers may lose power; examine independent power paths and service design.
2. The upstream device remains a shared failure dependency.
3. Contract, authorized access, escort/change procedure, and tenant security.
4. Actual VM power/allocation state and other chargeable resources; logout alone is insufficient.
5. Duration, baseline, workload, queues/latency, service health, impact and incident policy.

## Part C — Recall / Apnay alfaaz mein jawab dein
1. What is the difference between physical infrastructure, virtualization and cloud?
2. Why should an engineer challenge the requested number of servers?
3. Name four customer questions about a facility.
4. Explain PSU and PDU.
5. What is a failure domain?
6. How do private data centers, shared facilities and public cloud differ?
7. Can hardware bought next year still be CapEx? Why?
8. What is the difference between an Azure resource and resource group?
9. What does AVD stand for?
10. How does response differ from restoration?
11. Are the lecture's P1 timings universal?
12. Why does CPU utilization alone not establish P1?
13. Why is governance broader than government regulation?
14. What important issue remains at the transcript's ending?
15. What practical evidence have you personally produced from this lesson?

### Answer guide
1. Physical hardware supplies capacity; virtualization shares hosts between VMs; cloud supplies computing services with service-specific responsibilities.
2. The number needs workload, performance, growth and resilience evidence.
3. Examples: location, cooling, power, security, recovery, support.
4. Power Supply Unit; Power Distribution Unit.
5. A shared dependency boundary where one failure can affect multiple components.
6. Dedicated organizational environment; multi-customer hosting; cloud service delivery. These categories are not interchangeable.
7. Yes. Capitalization depends on the asset/expenditure and accounting policy, not merely purchase date.
8. A resource is a managed component/service; a resource group logically contains related resources.
9. Azure Virtual Desktop.
10. Acknowledgment/engagement versus returning service or resolving under agreed definitions.
11. No; these are example commitments.
12. Impact, urgency, duration and service condition also matter.
13. Governance includes organizational resource, access, policy and cost controls as well as compliance concerns.
14. The resolution discussion ends mid-sentence at 01:23:41; do not invent its continuation.
15. Your completed checklist and an explanation in your own words; this worksheet does not prove Azure deployment ability.

## Part D — Self-assessment
- [ ] I completed the requirements table without inventing measurements.
- [ ] I explained physical, virtualized and cloud approaches without reading.
- [ ] I corrected the CapEx/OpEx and billing misconceptions.
- [ ] I can distinguish a resource group from server count.
- [ ] I can explain response and restoration using an example clock.
- [ ] I recorded questions for the trainer.

## Questions to ask next class
Confirm the actual calendar, lab subscription arrangement and assigned practice. Ask whether the last resolution sentence continues in another recording. Clarify the P3 resolution wording in the earlier short notes. Request any missing technical diagram or slide that captions cannot describe.
