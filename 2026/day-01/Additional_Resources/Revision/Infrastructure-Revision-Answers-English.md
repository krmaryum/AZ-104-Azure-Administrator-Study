# Infrastructure Foundations — Five Revision Questions and Answers

**Language:** English  
**Context:** VMware home lab and Azure administration foundations  
**Suggested repository folder:** `05-Revision/`

## 1. What Is the Difference Between Physical Infrastructure, Virtualization, and Cloud?

| Term | Meaning | Example in Your Environment |
|---|---|---|
| **Physical infrastructure** | Actual hardware and supporting facilities, including processors, memory, disks, networking, power, and cooling | Your desktop, laptop, and network equipment |
| **Virtualization** | Running virtual computers on physical hardware | DNS01, DNS02, and DNS03 running in VMware |
| **Cloud** | Provisioning and using computing resources and services on demand | Creating an Azure VM or storage account |

Cloud still runs on physical hardware. The difference is how resources are provided and managed. Creating VMs alone does not automatically create a cloud.

**Remember:** physical infrastructure supplies the hardware; virtualization creates virtual computers; cloud provides a model for delivering and consuming computing services.

## 2. What Should You Ask Before Accepting a Request for 15 Servers?

Start with: **“What must these servers do, and how did you calculate that you need 15?”**

Then establish the requirements:

- Which applications and services will run?
- How many users and how much peak demand are expected?
- How much CPU, RAM, storage capacity, storage performance, and network bandwidth are required?
- What downtime is acceptable, and what backup and recovery arrangements are needed?
- What security, access, and location requirements apply?
- Who will manage the hardware, operating systems, patching, and monitoring?
- What are the budget and growth expectations?

Only after assessment can you decide whether 15 servers are appropriate. The request might require fewer or more servers, depending on workload and availability requirements.

**Remember:** understand the workload before choosing the number or size of servers.

## 3. Can Servers in Different Racks Still Share a Dependency?

**Yes.** They might share the same:

- Upstream switch or router.
- Power source or UPS.
- Storage system.
- Cooling system.
- Building or site.

**Example:** DNS01 is in Rack A and DNS02 is in Rack B, but both connect through one upstream switch. If that switch fails, both servers could lose connectivity.

Separate racks do not guarantee independence. Check the complete dependency path and how the application handles failures.

**Remember:** equipment can be physically separated while still depending on a shared component.

## 4. Why Can Hardware Purchased Later Still Be CapEx?

Classification depends on **the nature of the purchase**, rather than simply when it occurs.

A server purchased next year may provide value for several years. It can therefore qualify as a capital asset under the organization's applicable accounting policy.

| Expense | Typical Classification |
|---|---|
| Purchasing a long-lived server | **CapEx — Capital Expenditure** |
| Electricity and routine operating services | **OpEx — Operating Expenditure** |
| Recurring cloud consumption | **Common OpEx example** |

CapEx is not limited to the initial cost of starting a business. Buying additional equipment later does not automatically make it OpEx. Actual accounting treatment follows the applicable policy.

**Remember:** the asset and expense type matter more than the purchase date.

## 5. What Is the Difference Between Response, Restoration, and Resolution?

| Term | Meaning | Website Outage Example |
|---|---|---|
| **Response** | Acknowledge the incident and begin engagement under the agreed process | “We received the ticket and are investigating.” |
| **Restoration** | Return the service to an acceptable working state, possibly using a workaround | Redirect traffic to a backup server |
| **Resolution** | Address the incident according to the agreed process and verify the outcome | Confirm functionality and resolve the incident |

Restoration may happen before a permanent fix. Root-cause investigation and permanent corrective work can continue through **problem management** after the incident is resolved.

Check the agreement's definitions: response, restoration, and resolution targets may use different clocks and conditions.

**Remember:** response = engage; restoration = restore service; resolution = resolve the incident under the agreed process.

## Quick Self-Check

- [ ] I can explain physical infrastructure, virtualization, and cloud using my own lab.
- [ ] I can ask useful questions about a server request before proposing a design.
- [ ] I can identify shared dependencies across different racks.
- [ ] I understand why later hardware purchases can still be CapEx.
- [ ] I can distinguish response, restoration, and resolution.
