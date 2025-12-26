# OS

## Glossary

* **Console** = physical keyboard/display/teletype directly attached to a computer, that receives kernel messages an login prompts
* **Copy-on-Write** (COW) = shared data resource management technique, used for virtual memory management and computer storage (flesystems/DBs)
  * For VM = when `fork`-ing, child process don't immediately get a new physical copy of its parent's memory, instead kernel intercepts first write operation attempt and allocate a physical page then
    * That is because most fork children do not modify any memory and immediately execute a new process, so they often can just read(-only) from their parent's memory, thereby avoiding unnecessary memory allocation
  * For storage = similar to journaling, instead of overwriting existing data immediately, first create a new copy when changes are made, while keeping original (allows snapshot-like history)
* **Fork** = clones a new process (returns new child _PID_ in parent and _0_ in child itself)
* **Hypervisor** = soft/firm/hard-ware creates & runs a VM (eg _Oracle VirtualBox_, _VMWare Workstation (Pro)_, _Hyper-V_ by _Microsoft_)
* **Kernel** = OS core with complete control over everything, always resides in memory, handles hardware resources via device drivers, file system, network sockets
* **Kernel Space** = strictly protected to run a privileged OS kernel, kernel extensions & device drivers
* **Kernel Stack** = OS memory space where interrupted process context gets saved to be restored eventually
* **Operating System** = interaction between hardware components, common platform for applications, human interfaces, files/memory/applications management
* **Process** = program instance being executed in memory
  * **Daemon** = program running as a background process (eg Windows service, Unix utilities _syslogd_, _sshd_, _cron_)
  * **Orphan** = process whose parent has finished/terminated but remains running itself
  * **Zombie** = completed execution (via `exit` syscall) but still has entry in process table, (cannot be `kill`ed)
* **PXE** (Preboot eXecution Environment) = install an OS remotely from network
* **Secure Boot** = UEFI process to ensure a device/PC has not been tampered with using a hash chain, requires dedicated hardware (eg motherboard UEFI firmware chip or Apple T2 security chip acting as hardware root of trust)
* **System Call** (syscall) = how a program requests a service from OS (eg hardware HDD or camera, creating new processes, kernel services such as process scheduling)
* **Trap** = a way (imilar to interrupts) for kernel to regain control when a process performs an illegal operation (eg divide by 0) so that it can handle it (eg kill it)
* **User Space** (or **User-land** or **User Mode**) = everything a program can touch while CPU is running in _user_ mode (ring 3 on x86 ie lower priviledges)
* **Virtual Machine** = a software emulated computer hardware system that can be parametered, cloned (ideal to quickly deploy identical OS images since hardware is virtually identical on all machines)

* _ReactOS_ = FOSS OS binary-compatible with programs & drivers developed for Windows (Server 2003)

### Hardware & Drivers

* **BIOS** (Basic Input/Output System) = firmware that configures/initializes hardware devices, startup sequence, loads & runs booloader of the designated startup drive, provides runtime services to OS & programs
  * **EFI** (Extensible Firmware Interface) = predecessor of UEFI, firmware interface specification for managing boot
  * **EFI System Partition** (ESP) = small unencrypted partition containing minimal bootloader code (including pre-boot login screen, eg BitLocker or FileVault password invite)
  * **POST** (Power-On Self-Test) = process performed by firmware/software immediately after computer is powered on
  * **UEFI** (Unified Extensible Firmware Interface) = firmware architecture open standard/specification, does not rely on boot sectors but on EFI System Partition (ESP)
    * Offers faster/flexible booting, booting from large disks, more/larger partitions, better hardware initialization (handles 64-bit drivers), Secure Boot, graphical (not just text-based) & network capabilities, extensibility
* **Bootloader** (Bootstrap Loader) = program located on boot sector (and often extends beyond it) that initializes system hardware, loads & transfers control to (one of possibly several installed) OS kernel
* **Bus** = data communication system inside (eg non-directional internal CPU registers bus) or between components inside or between computers
* **Controller** = hardware chip/component part of/piloting a device, manages communication between CPU (high-level operations issued from OS/driver) & peripheral (low-level device-specific) operations (eg timing, buffering, protocol)
* **CPU Ring** = privilege level (eg _0_ for full hardware authority for kernel code, less for higher numbers)
* **DDR** (Double Data Rate) = transfers information twice as fast as **SDR** (on each clock cycle ups & downs)
  * Successive versions of DDR increase chips capacity and/or transfer speeds, and are not backwards compatible
* **DIMM** (Dual In-line Memory Module) = recto/verso memory bar of memory chips
  * **SO-DIMM** (Small Outline DIMM) = about half-sized DIMM for laptops
* **Direct Memory Access** (DMA) = lets a controller read/write data from/to memory without CPU use (except for telling controller where in memory that data resides/goes)
* **Driver** = software on host system (OS) allowing it and CPU to communicate with device('s controller)
  * Formats OS commands according to controller's protocol
  * Exposes a standard interface (eg SATA, NVMe, USB) for OS to pilot device-specific details
* **Firmware** = software part of a hardware controller providing low-level control of a device, acting as its minimal OS (initializing, managing internal state, interpreting/executing driver commands)
* **Front Panel Header** = pins near bottom right of motherboard to control power & reset switch/LED, HDD LED, speaker
* **Interrupt** = signal sent to CPU to be handlded by OS
  * **CPU-originated** = exception (divide by zero, page fault), internal timer (OS scheduled task)
  * **Hardware** = device controller (disk, network, keyboard)
  * **Software** = system calls using special CPU instructions
* **PCI** (Peripheral Component Interconnect) = parallel expansion bus standard to connect peripheral components (network/sound cards, storage controllers) to CPU & memory subsystem (replacing ISA)
* **PCIe** (PCI express) = packed-based scalable (x1, x4, x8, x16 as independent serial lanes/links) high-speed serial expansion bus to connect peripherals (GPU, SSD, NIC) directly to CPU/chipset (replacing PCI & AGP)
* **Peripheral** = device such as disk & USB controllers, peripherals, network cards
* **System Bus** = single BUS connecting marjor components, combiging functions of data (information), address (where from/to) & control (which operation)
  * **Address** = address of RAM or I/O devices for usage by CPU
  * **Data** = data words being read/written between CPU & RAM/devices
  * **Control** = timing & control signals (read/write, interrupts, clock, etc)
* **TPM** (Trusted Platform Module) = hardware chip to store cryptographic keys (notably for BitLocker & Windows Hello) outside of the OS and reduce malware by 60%

* _Arduino_ = single-board microcontrollers (by open-source hard/software Italian company)
* _Raspberry Pi_ = single board computers (SBC)

#### Disk Storage & Partitions

* **Block** = logical unit of I/O between FS/OS and storage (usually same as one or multiple sectors)
* **Boot Sector** = a storage device's (CD, DVD, HDD, SSD, USB) sector at a well-known location (usually address 0) containing machine code loaded into RAM then executed by BIOS/UEFI to begin boot process (ie launch an OS)
  * **MBR** (Master Boot Record) = first sector on a physical partitioned drive (for 32-bit IBM PC/BIOS-compatible systems, up to 4 primary partitions + 1 extended with multiple logical partitions, max partition size of 2TB)
  * **VBR** (Volume Boot Record) = first sector on a physical non-partitioned drive or of a logical (formatted hence containing a FS) partition, created during formatting
* **Cluster** = FS unit of disk space allocation (typically several contiguous sectors, minimal space a file occupies on disk)
* **Cylinder** = division of data in disk drive
* **Disk Controller** = firmware & hardware on physical device
* **GPT** (GUID Partition Table) = part of UEFI (which does not require executable code at LBA 0), SSD/HDD partition tables layout standard (up to 128 partitions, each over 9 billion TB or 256TB on Windows)
  * Actually uses a 'fake' MBR partition at sector 0 to protect its actual data (starting at sector 1) from older tools, and maintain compatibility with those tools that expect a boot sector at LBA 0
* **Head** = I/O device that reads/writes data to disks
* **IOPS** (Input/Ouput Operations per Second) = broad metric of maximum performance of a disk
* **Logical Block Addressing** (LBA) = simple linear logical address scheme used by OS to communicate with disk controller & operate (ie read/write) at a physical location (eg LBA 0 through to end of entire disk, not by partition)
  * Abstracts/hides away physical geometrical considerations (cylinders, heads, sectors), lets disk controller manage its internal storage, providing features such as wear leveling
* **NVMe** (Non-Volatile Memory express) = open logical-device interface specification for accessing a computer's non-volatile storage media (usually NAND flash memory) via PCIe bus
* **Partition** = logical division of a storage disk, which can be formatted as a volume (mounted or not)
* **RAID** (Redundant Array of Independent Disks) = data storage virtualization technology combining multiple physical components into logical units for performance and/or redundancy
  * **RAID 0** = striping (performance only)
  * **RAID 1** = mirroring (redundancy only)
  * **RAID 2** = bit-level splitting with Hamming code (performance only)
  * **RAID 3** = bit-level striping with dedicated parity disk
  * **RAID 4** = block-level striping with a dedicated parity disk (ie a worse RAID 5)
  * **RAID 5** = block-level striping with distributed parity (single disk failure can be recovered, by revert-XORing parity)
  * **RAID 6** = RAID 5 + second parity block (double disk failure can be recovered)
  * **RAID 10** = RAID 1 + RAID 0
* **S.M.A.R.T** (Self-Monitoring, Analysis and Reporting Technology) = disk's vitals (eg temperature, spins retries, error rate)
* **SATA** (Serial AT Attachment) = computer bus interface standard for connecting a motherboard (specifically host bus adapter or HBA) to storage devices
  * **eSATA** (external SATA) = SATA connection for external storage devices
  * **mSATA** (mini SATA) = smaller SATA for laptops
  * **m.2** = (replaces older mSATA), specification for internally mounted computer expansion cards and connectors
  * **SATAe** (SATA express) = computer bus interface supporting both SATA & PCIe
* **Sector** = smallest physical addressable storage unit on a disk along a Track (ie an arc, 512B or 4KB for newer HDD/SDDs)
* **Track** = physical circular path on a disk surface
* **Volume** = a formatted partition or a virtual volume (eg dynamic disk, VeraCrypt container, VHD), can exist in an unmounted state (ie no drive letter but appear in Disk Management)
* **Wear Leveling** = technique used by SSDs type drive to spread write/erase cycles over all physical flash cells

### File System

* **Block** = smallest unit of data a FS or disk uses to read/write (like pages in a book)
* **Block Pointer** = FS-level references to block of data within FS address space (can be direct/indirect ie linked-lists-like), mapped to LBAs by OS using FS specific layout information
* **Clobber(ing)** = overwriting (a file)
* **File Handle** (Windows) = opaque pointer-sized HANDLE (`void*` or `uintptr_t`)
* **File System** (FS) = file organization & access
  * **APFS** (Apple FS) = designed/optimized for SSDs speed/security/reliability (using CoW to immutably write to new location instead of journaling then overwriting in place)
    * Features = native encryption (none, per-volume à la FileVault, or even per-file), snapshot (read-only system restore), cloning (ie file CoW)
    * **APFS Container** = shares available space to be consumed by multiple growing volumes dynamically (so they don't have to be sized up manually)
  * **EFS** (Encrypting FS) = feature of NTFS that provides transparent FS-level (ie individual files & folders) encryption
  * **exFAT** (Extensible File Allocation Table) = (2006) Microsoft file system optimized for (USB, SD cards) flash drives (files can be larger than 4Go), compatible across many OSes
  * **ext4** = journaling FS for Linux & Android OS (update to ext3)
  * **FAT** (File Allocation Table) = MS-DOS/Window 9x-era file system, originally for use on flopy disks (up to 2To disk, 4Go file)
  * **FHS** (File Hierarchy Standard) = reference describing (directory structure) conventions used on Unix-like systems
  * **HFS+** (Hierarchical File System Plus, aka Mac OS Extended) = older (1998-2017) macOS FS before APFS, journaling, permissions, fixed partitions (no space sharing, cloning, snapshots)
  * **NTFS** (Windows NT FS) = proprietary Microsoft journaling FS, extensive improvements over FAT32 (compression, encryption, large files), originally not very compatible
  * **ReFS** (Resilient FS) = modern update to NTFS, very large drives, self-repairing (no more `chkdsk`)
  * **XFS** (Extended FS) = high-performance (large-scale computing) 64-bit journaling FS used in data centers, supported by most Linux distributions (created by Silicon Grapics in 1993)
* **Inode** = Unix-style file system data structure describing file & directory objects (ID, (timestamp) metadata, permissions, physical disk location)
  * Physical disk location is indirectly provided via Inode **Block Pointer**s referencing a **Logical Block Address**es (LBA) usable by disk firmware
  * File names are not stored in Inode but in file parent folder/directory (ie a special type of file mapping files names to Inode IDs)
* **Inode Table** = Kernel-managed mapping of inodes to their content on disk
* Links
  * [NTFS links](https://en.wikipedia.org/wiki/NTFS_links)
  * **Hard Link** = directory entry associating a name with a file (there can be multiple entries pointing to same physical file, ie another name to same inode)
    * **Junction Points** = hard link for a folder (hard links to directories are usually not permitted as they can cause a circular structure and interferences with programs)
  * **Soft Link** or **Symbolic Link** = file whose content is a (filesystem) path to another (potentially now moved/erased) file (eg Windows shortcut file)
* **Journaling** = crash-consistency guarantee mechanism using a write-ahead log/journal where sets of planned updates are first written, then marked as done when successfully completed
* **Mounting** = attaching a filesystem (regardless of provenance) to a specific directory

### Memory

* **Anonymous Memory** = memory allocated to a process but not backed by a file (descriptor), ie only via local pointer
* **ASLR** (Address Space Layout Randomization) = (on modern 64-bit systems) randomizes starting positions of Stack & Heap for security
* **Fragmentation** = degradation of memory allocation capability leading to storage inefficiency or impossibility
  * **Internal** = natural space of memory waste due to paging managing fixed-sized slots
  * **External** = remaining free memory is composed of smaller disjointed blocks, preventing larger blocks from being stored
  * **Data** (File System) = stored data is exploded and non-contiguous (due to external fragmentation), leading to poor performance
* **Logical Memory** = a process's internal (virtual) memory, ie what memory it thinks it has (starting at absolute address _0_ from its viewpoint, which is really an offset)
* **Mapped Memory** = memory that Kernel has allocated for a process, constituting its address space, within which it is constrained (or face a segfault)
* **Memory Layout** (of a process) = logical subdivision of a process into so-called segments (ie code/text, data, bss, heap, stack), unrelated to Memory Segmentation
  * **Code/Text** = contains executable code (generally read-only & fixed size for static typed language)
  * **Data** = initialized static variables
  * **BSS** (Block Starting Symbol) = uninitialized static variables & constants
  * **Heap** = dynamically allocated memory (starts after BSS)
  * **Stack** = LIFO structure (grows towards heap) where local (function) variables are saved (eg value-types, reference-types heap addresses, fixed-sized array buffers)
    * **Stack Frame** = block of data created when a function is called (return address, local variables, arguments, etc)
* **Memory Management Unit** (MMU) = CPU electronic component that translates virtual into physical addresses (using mapping page tables in RAM pointed to via a register)
  * Only the CPU can touch wires this fast—nanoseconds per memory access—so the MMU has to live right inside the core
  * **TLB** (Translation Look-aside Buffer) = tiny very-fast cache inside MMU that stores recent results of page-table walks
* **Memory-Mapped File** = segment of virtual memory assigned a direct byte-for-byte correlation with some file(-like) resource portion
  * File is any resource OS can reference through a file descriptor (eg disk file, shared memory, device)
* **Memory Paging** = divides a process address space into small fixed-sized chunks that can be swapped in/out to RAM/disk, but can cause process fragmentation
* **Memory Segmentation** = hardware-level mechanism by older CPU to add base + limit to every address, dividing memory into atomic segments of varying sizes, can cause free memory fragmentation
  * That is achieved via segment registers (CS code, DS data, SS stack), largely replaced with paging on modern 64-bits CPU/OS
  * Segments, like page, are addressable (via a segment selector & an offset) and can be swapped in/out from/to disk
* **Page (Frame)** = small (kernel/only user permitted) area of virtual memory of same size (eg 4K), not necessarily aligned with segment boundaries
* **Page Fault** = interrupt/exception generated by CPU when a program tries to access a portion of memory (ie a page) not currently in physical RAM, leading to a page swap by OS or a termination if page is invalid (segmentation fault)
* **Page Table** = data structure residing in memory (ie so MMU can access it) mapping virtual (a process internal addresses) and physical addresses (in RAM and/or disk)
* **Page Table Base Register** (PTBR) = CPU register containing (RAM) address of pages table
* **Page Table Entry** (PTE) = one entry in pages table
* **User space** = memory area where application software and drivers execute (typically one address space per process)
* **Virtual Address Space** = a process's internal private coordinate system for memory (starting at 0 internally)
* **Virtual Byte** = a byte of virtual memory (ie from viewpoint of a process)
* **Virtual Memory** = mechanism which lets a process manage its internal address space as a contiguous address space, independently from their physical locations
  * Uses pagination/segmentation techniques to map to either physical RAM or HDD, or nothing yet (page is not present, first access will cause kernel to allocate or load it)
