# IT Infrastructure — Core Terms Study Notes

**Language:** English  
**Learning context:** VMware home lab, Windows DNS servers, Linux, and Azure foundations  
**Prepared:** 31 October 2026  
**Suggested repository location:** `Shared_Resources/Topic_Notes/IT-Infrastructure-Core-Terms/IT-Infrastructure-Core-Terms-English.md`

> **Purpose:** Understand CPU, RAM, disks, network interfaces, operating systems, servers, virtual machines, services, applications, cloud, data, databases, and workloads—and how they work together in your lab.

## Contents

1. [Your lab at a glance](#1-your-lab-at-a-glance)
2. [CPU](#2-cpu)
3. [RAM](#3-ram)
4. [Disks and storage](#4-disks-and-storage)
5. [Network interfaces](#5-network-interfaces)
6. [Operating system](#6-operating-system)
7. [Server](#7-server)
8. [Virtual machines and hypervisors](#8-virtual-machines-and-hypervisors)
9. [Service](#9-service)
10. [Application](#10-application)
11. [Cloud](#11-cloud)
12. [Data](#12-data)
13. [Database and DBMS](#13-database-and-dbms)
14. [Workload](#14-workload)
15. [Following a DNS request](#15-following-a-dns-request)
16. [A website example](#16-a-website-example)
17. [Common misunderstandings](#17-common-misunderstandings)
18. [Verify your own environment](#18-verify-your-own-environment)
19. [Quick revision](#19-quick-revision)
20. [Practice questions and answers](#20-practice-questions-and-answers)

## 1. Your Lab at a Glance

Your physical computer is the **host**. If VMware Workstation runs on it, Workstation can run **virtual machines**, such as DNS01, DNS02, and DNS03. Each VM runs its own guest operating system and uses the host's physical resources.

| Layer | Example in your lab | Purpose |
|---|---|---|
| Physical hardware | Your desktop or laptop | Supplies CPU, RAM, storage, and physical connectivity |
| Host OS | Windows on the Workstation computer | Manages the physical computer and host applications |
| Virtualization software | VMware Workstation | Creates and runs VMs |
| Guest machine | DNS01 VM | Provides a virtual computer |
| Guest OS | Windows Server inside DNS01 | Manages the VM's resources and software |
| Service | DNS Server service | Answers DNS queries |
| Data | DNS records and logs | Represents the information used or produced |
| Workload | DNS name resolution | Represents the task and its resource requirements |

**How ESXi differs:** ESXi is a bare-metal hypervisor; it does not require installation on top of a Windows host OS like Workstation. Running ESXi inside a Workstation VM is **nested virtualization**. The table shows a simple Workstation setup, rather than asserting the exact topology of every part of your lab.

## 2. CPU

**Full form:** Central Processing Unit  
**Definition:** The processor executes instructions used by the operating system and applications.

### What Does It Do?

The CPU performs calculations, evaluates program logic, and executes instructions. It supplies processing capacity for running software.

### In Your Lab

When DNS01 receives a query, the CPU executes the DNS software's instructions. Running Linux commands or processing logs also uses CPU capacity.

### Physical CPU and vCPU

- **Physical CPU:** the host's actual processor.
- **Core:** a processing unit within a processor.
- **vCPU:** a virtual processor presented to a VM, whose execution is scheduled on the host.

Assigning **2 vCPUs** does not mean two physical cores are permanently reserved for that VM. Scheduling and resource controls depend on the virtualization configuration.

### Remember

High CPU usage alone does not prove a fault. Check its duration, the normal baseline, the workload, and user impact. Several busy VMs can compete for the host's processing capacity.

## 3. RAM

**Full form:** Random Access Memory  
**Definition:** RAM holds instructions and data that running software needs to access quickly.

### What Does It Do?

RAM is the working memory for the OS, programs, and their active data. Ordinary RAM is volatile: its contents are not retained when power is removed. Hibernation and saved-state features can write memory contents to disk; this does not make RAM permanent storage.

### In Your Lab

Windows Server, the DNS service, and cached information use RAM inside DNS01. Windows and VMware Workstation also need memory on the physical host.

**Example:** if a host has 16 GB RAM and three VMs are each configured with 4 GB, their total configured memory is 12 GB. You must also account for the host OS and virtualization overhead. Actual consumption varies with configuration and workload.

### What If Memory Is Insufficient?

The OS may use paging or swapping, and performance can slow down. Check the host's available capacity before increasing a VM's memory allocation.

## 4. Disks and Storage

**Definition:** Storage retains the operating system, applications, configuration, and data beyond the lifetime of a running process.

### What Does It Do?

SSDs and HDDs store the OS, installed software, files, and configuration. Saved data normally survives power-off, but deletion and hardware failure can still cause loss. Persistent storage is not a substitute for backup.

### In Your Lab

DNS01's Windows Server installation, logs, and zone files—when file-backed zones are used—reside on storage. VMware Workstation virtual disks are commonly represented by `.vmdk` files on the host's storage.

| Term | Meaning |
|---|---|
| Physical disk | The host's SSD or HDD |
| Virtual disk | The disk presented to a VM |
| Capacity | How much data can be stored |
| Performance | How quickly reads and writes can be completed |

**Example:** a 60 GB growable virtual disk may initially occupy less than 60 GB on the host, then grow as it is used. Preallocated disks can behave differently. Check both guest free space and host free space.

**Important:** if three VMs store their virtual disks on the same physical disk, they share that device's performance capacity.

## 5. Network Interfaces

**Related terms:** NIC — Network Interface Card/Controller; vNIC — virtual NIC  
**Definition:** A network interface provides a connection through which a system sends and receives network traffic.

### What Does It Do?

Physical examples include Ethernet and Wi-Fi adapters. A VM uses a virtual adapter to connect to virtual networking.

An interface can have IP addresses configured on it. An interface is not limited to one address, and the presence of an adapter alone does not prove connectivity.

### In Your Lab

DNS02 sends a query through its vNIC. VMware networking carries the traffic toward DNS01. When both VMs communicate through a virtual network on the same host, that traffic does not necessarily pass through the physical Wi-Fi adapter.

| VMware Mode | Basic Idea | Important Detail |
|---|---|---|
| Bridged | Connects the VM to the external LAN | Address assignment and reachability depend on LAN and adapter configuration |
| NAT | Provides translated outbound connectivity from a private virtual network | Inbound access may require additional configuration |
| Host-only | Provides a private network between the host and attached VMs | Normally does not directly provide internet access |

A physical NIC, a vNIC, an IP address, and a firewall rule are different things. Successful communication depends on their configuration and the network path.

## 6. Operating System

**Abbreviation:** OS  
**Definition:** An operating system manages hardware resources and provides an environment for programs to run.

### What Does It Manage?

The OS manages CPU scheduling, memory, storage, devices, users, and processes. It provides interfaces through which applications use resources.

### In Your Lab

- Windows on the physical Workstation computer is the **host OS**.
- Windows Server inside DNS01 is that VM's **guest OS**.
- Rocky Linux or Ubuntu inside a Linux VM is that VM's **guest OS**.

**Important distinction:** Windows Server is an OS product name. DNS server describes a functional role. Installing the OS does not automatically install and configure the DNS role.

## 7. Server

**Definition:** A server provides functionality or resources to clients over a defined interface or network.

The word **server** can refer to different things depending on context:

| Context | Example |
|---|---|
| Hardware | A physical rack server |
| Machine's role | DNS01 acts as a DNS server |
| Software | DNS server software answers queries |

### In Your Lab

DNS01 is both a **VM** and a **DNS server**. VM describes the type of computer; server describes its role.

DNS02 can act as a client when requesting a zone transfer from DNS01, while acting as a server when answering other clients' queries.

A server does not have to be physical or run Windows. A Linux VM can provide web, DNS, database, or file services.

## 8. Virtual Machines and Hypervisors

**Abbreviation:** VM — Virtual Machine  
**Definition:** A VM is a software-defined computer with virtual processing, memory, storage, and networking resources.

### What Can a VM Contain?

| Resource | Illustrative Configuration |
|---|---|
| vCPU | 2 |
| RAM | 4 GB |
| Virtual disk | 60 GB |
| vNIC | 1 |
| Guest OS | Windows Server |

**These are example settings, not a statement of DNS01's actual configuration.**

A **hypervisor** runs VMs and manages their access to host resources. VMware Workstation and ESXi are virtualization platforms, but their installation architectures differ.

A VM is a computer. It can contain an operating system, applications, and services. Multiple VMs can share a physical host, so a host failure can affect several VMs at once.

## 9. Service

**Definition:** A service provides a defined function; in OS administration, the term often refers to software managed to run in the background.

### In Your Lab

- The Windows **DNS Server service** provides name resolution.
- The Linux **sshd service** provides SSH remote access.
- The Linux **nginx service** can provide web serving or reverse proxy functionality, depending on configuration.

A service depends on correct configuration and functioning dependencies. A **Running** status is a useful check, but a successful end-to-end request provides stronger evidence that the intended function works.

**Context matters:** a cloud service is not necessarily one local background process. Interpret the word service according to the system being discussed.

## 10. Application

**Definition:** An application is software designed to perform a specific task or set of tasks.

### In Your Environment

| Application | Purpose |
|---|---|
| Chrome | Access websites |
| VS Code | Edit notes and code |
| VMware Workstation | Manage and run VMs |
| DNS Manager | Administer DNS configuration |
| NGINX | Serve web content or act as a reverse proxy, depending on configuration |

### How Applications and Services Relate

These categories overlap. NGINX is a server application that can run as a background service. Applications do not always need interactive windows, and not every application runs as a service.

**DNS Manager** is a management tool. The **DNS Server service** answers DNS queries. Closing the management window does not necessarily stop the background service.

## 11. Cloud

**Definition:** Cloud computing provides on-demand access to shared computing resources and services that can be provisioned and managed through service interfaces.

### Connection to Your Lab

In your VMware home lab, you operate the host hardware. In the cloud, a provider such as Azure supplies infrastructure and services. You provision and configure a VM or another service according to your requirements.

| Aspect | Home VMware Lab | Azure VM Example |
|---|---|---|
| Physical hardware | You operate it | Provider operates it |
| Power and cooling | Your arrangement | Provider's arrangement |
| VM configuration | You configure it | You configure it |
| Guest OS and workload | You manage them | Customer responsibilities generally remain |
| Capacity and costs | Host capacity and your operating costs | Selected services, usage, and agreement |

**Shared responsibility:** responsibilities change with the service selected. The Azure VM example should not be applied unchanged to every managed cloud service.

**Remember:** creating VMs alone does not prove that an environment is a private cloud. Cloud can be public, private, or hybrid, so describing it only as “someone else's computer on the internet” is incomplete.

## 12. Data

**Definition:** Data is information represented in a form that can be stored, processed, or transmitted.

### In Your Lab

Examples include:

- Hostnames and IP addresses.
- DNS records and logs.
- Usernames and configuration files.
- Screenshots, PDFs, and Markdown notes.
- Monitoring measurements, such as CPU utilization.

**Illustrative DNS record:**

```text
dns01.vcplab.com → 10.0.0.20
```

**The IP is an example; verify your actual server address.** The hostname and IP address are data. The DNS service uses records to answer queries.

Data can be stored on disk, processed in RAM, and transmitted across a network. It includes more than files and database rows.

## 13. Database and DBMS

**Database definition:** An organized collection of related data that can be retrieved and updated.

**DBMS — full form:** Database Management System  
**DBMS definition:** Software used to store, query, update, and manage databases.

| Term | Example |
|---|---|
| Data | Khalid's name and selected course |
| Database | An organized collection of learners and enrollments |
| DBMS | PostgreSQL, MySQL, or Microsoft SQL Server |
| Database server | A machine or software providing database functionality, depending on context |

### Illustrative Records

| User ID | Name | Course |
|---|---|---|
| 101 | Khalid | Azure |
| 102 | Ahmed | Linux |

These are sample records. Not every database uses tables; different database models exist.

### Connection to DNS

DNS records are structured information. Depending on configuration, Windows DNS zone data can be file-backed or stored in Active Directory. Running DNS does not require installing MySQL.

**Important:** the data collection and the software managing it are different concepts. NGINX is web-server/reverse-proxy software, rather than a database engine such as PostgreSQL.

## 14. Workload

**Definition:** A workload is an application, service, or set of components performing a task, together with the resources and operating requirements needed to support it.

### Your DNS Workload

It can include:

- The DNS service and its configuration.
- DNS records and cached information.
- Receiving and answering queries.
- Required CPU, RAM, storage, and network capacity.
- Availability, security, and monitoring requirements.

| Term | Meaning for DNS01 |
|---|---|
| VM | The computer on which the work runs |
| OS | Windows Server managing the machine |
| Service | DNS software providing name resolution |
| Data | Records, cached information, and logs |
| Workload | DNS functionality and its relevant operating requirements |

### Workload Versus Load

**Workload:** what is running and what it needs to operate.  
**Load:** the amount of demand at a particular time, such as queries per second.

More queries may increase resource requirements, but every resource does not necessarily grow in direct proportion. Use measurements for sizing.

A workload can span several VMs and services. One VM can also run several workloads.

## 15. Following a DNS Request

**Scenario:** DNS02 asks DNS01 to resolve a hostname.

1. DNS02 generates a request and sends it through its network interface.
2. VMware networking carries the traffic along the configured path to DNS01.
3. DNS01's OS delivers the traffic to the DNS service.
4. The CPU executes instructions, using working information in RAM.
5. The DNS service prepares its response using available configuration, cached information, zone data, or information obtained from other DNS servers, as appropriate.
6. The response travels back through the network interface to DNS02.
7. Configured logging or updates may use storage as needed.

**Important:** every DNS query does not require a disk read. Relevant information may already be in RAM or cache. Physical hardware supports the entire process.

## 16. A Website Example

**This is a learning example, not a claim that this website is deployed in your lab.**

| Term | Example |
|---|---|
| Cloud | Azure, where resources are provisioned |
| VM | An Ubuntu virtual machine |
| OS | Ubuntu Linux |
| CPU | Processes web requests |
| RAM | Holds running processes and working data |
| Disk | Stores the OS, application files, and logs |
| Network interface | Receives requests and sends responses |
| Server | The VM's web-server role |
| Application | The website's software |
| Service | NGINX running in the background |
| Data | Names, course information, and orders |
| Database | Organized user and order records |
| DBMS | PostgreSQL or MySQL |
| Workload | Running the website, processing requests, and accessing data |

The website application and database can run on the same VM or on separate systems. The appropriate design depends on requirements, costs, security, and availability.

## 17. Common Misunderstandings

| Misunderstanding | Correct Understanding |
|---|---|
| RAM and disk are the same | RAM is active working memory; disks provide retained storage |
| Two vCPUs mean two permanently reserved physical cores | Scheduling and reservations depend on configuration |
| All VM traffic passes through physical Wi-Fi | Same-host traffic can remain within virtual networking |
| A server is always a physical machine | A server can also describe a VM's role or server software |
| Installing Windows Server makes DNS ready | DNS needs its role installed and configured |
| A VM and an OS are the same | A VM is a computer; the OS runs inside it |
| Applications always have windows | Background server applications also exist |
| A running service means everything works | Check configuration, dependencies, and end-to-end functionality |
| A database and a DBMS are the same | A database is the collection; a DBMS manages it |
| Each workload is one VM | A workload can span multiple resources and systems |
| Cloud is just virtualization | Cloud also involves a service delivery and provisioning model |
| High CPU always means P1 | Impact, urgency, duration, and policy also matter |

## 18. Verify Your Own Environment

These are read-only checks. Record your actual results rather than treating example values as your configuration.

### VMware Workstation

Select a VM and inspect its processors, memory, hard disk, and network adapter settings. Observe the configuration first; changing resource allocations is outside this exercise.

### Windows Host or Guest

Open **Task Manager → Performance** to inspect CPU, memory, disks, and adapters. On the host, you see host resources. Inside a guest, you see resources presented to the VM.

In PowerShell:

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

The memory fields shown here use KB units. No output from the DNS command does not itself prove a service failure; the DNS Server service might not be installed on that machine.

### Linux Host or Guest

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

`systemctl` requires a running systemd environment. Guest commands may show virtual hardware rather than the physical host's complete inventory. Interface output can include virtual and loopback interfaces.

### Record Your Findings

| System | Host/Guest | OS | CPU/vCPU | RAM | Disk | Network Mode/Interface | Main Role |
|---|---|---|---|---|---|---|---|
| Physical computer | Host |  |  |  |  |  | VMware host |
| DNS01 | Guest |  |  |  |  |  | DNS |
| DNS02 | Guest |  |  |  |  |  | DNS |
| DNS03 | Guest |  |  |  |  |  | DNS |
| Linux VM, if present | Guest |  |  |  |  |  |  |

## 19. Quick Revision

| Term | One-Line Meaning |
|---|---|
| CPU | Executes instructions |
| RAM | Holds the working data of running software |
| Disk | Retains the OS, files, and saved data |
| Network interface | Sends and receives network traffic |
| OS | Manages resources and programs |
| Server | Provides functionality to clients |
| VM | A computer with virtual resources |
| Hypervisor | Runs VMs and manages their access to resources |
| Service | A defined function; often background software in an OS context |
| Application | Software that performs specific tasks |
| Cloud | A model for on-demand computing services |
| Data | Information |
| Database | Organized related data |
| DBMS | Software that manages databases |
| Workload | Components performing work and their operating requirements |

**DNS01 in one sentence:** DNS01 is a VM that uses the physical host's resources, runs Windows Server, and performs a name-resolution workload through the DNS service and its data.

## 20. Practice Questions and Answers

### Try These First

1. Why does DNS01 need CPU, RAM, a disk, and a network interface?
2. How does a vCPU relate to a physical CPU?
3. Is DNS01 a VM or a server?
4. How do host and guest operating systems differ?
5. Does closing DNS Manager necessarily stop the DNS service?
6. Does every DNS query read data from disk?
7. What is the difference between a database and a DBMS?
8. How does workload differ from load?
9. Do two VMs always need physical Wi-Fi to communicate?
10. How do responsibilities change between a VMware home lab and cloud services?

### Answer Guide

1. CPU provides processing, RAM holds working information, the disk stores the OS and data, and the interface provides communication.
2. A vCPU is a virtual processor whose execution is scheduled on the host's physical CPU.
3. Both: VM describes the computer type, and DNS server describes its role.
4. The host OS runs on the physical host; a guest OS runs inside a VM.
5. No. DNS Manager is a management tool; the background service can keep running independently.
6. No. Relevant information may already be available in RAM or cache.
7. The database is the organized collection; the DBMS is the software managing it.
8. Workload describes the task and requirements; load describes demand at a particular time.
9. No. Same-host virtual networking can carry traffic without using the physical adapter.
10. In your lab, you operate physical hardware and facilities. In cloud services, the provider takes on infrastructure responsibilities, while your remaining responsibilities depend on the service selected.

### Completion Checklist

- [ ] I can explain every term in my own words.
- [ ] I can relate DNS01 to its VM, OS, service, data, and workload.
- [ ] I understand the difference between host and guest resource views.
- [ ] I have inspected my actual VM settings and completed the findings table.
- [ ] I can explain application/service and database/DBMS distinctions.

## Where to Keep This in Your Repository

Save the file here:

```text
AZ-104-Azure-Administrator-Study/Shared_Resources/Topic_Notes/IT-Infrastructure-Core-Terms/IT-Infrastructure-Core-Terms-English.md
```

Add this link to your root README if desired:

```markdown
- [IT Infrastructure — Core Terms (English)](IT-Infrastructure-Core-Terms-English.md)
```

Use this cross-topic reference alongside your Day 01 notes and revisit it as later classes introduce more detailed configurations.
