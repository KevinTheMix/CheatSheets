# OS

## Glossary

* **BIOS** (Basic Input/Output System) = de-facto firmware standard, performing hardware initialization during booting process, and providing runtime services for OS & programs
  * **GPT** (GUID Partition Table)
  * **POST** (Power-On Self-Test) = process performed by firmware/software immediately after computer is powered on
  * **UEFI** (Unified Extensible Firmware Interface) = firmware architecture open standard/specification
* **Fork** = clones a new process (returns new child _PID_ in parent and _0_ in child itself)
* **Kernel** = OS core with complete control over everything, always resides in memory, handles hardware resources via device drivers, file system, network sockets
* **Kernel Space** = strictly protected to run a privileged OS kernel, kernel extensions & device drivers
* **Kernel Stack** = OS memory space where interrupted process context gets saved to be restored eventually
* **Memory Management Unit** (MMU) = CPU electronic component that translates virtual into physical addresses (containing a portion of pages table)
* **NVMe** (Non-Volatime Memory Express) = open logical-device interface specification for non-volatile storage media, usually NAND flash memory via PCI Express bus
* **Process** = program instance being executed in memory
  * **Daemon** = program running as a background process (eg Windows service, Unix utilities _syslogd_, _sshd_, _cron_)
  * **Orphan** = process whose parent has finished/terminated but remains running itself
  * **Zombie** = completed execution (via `exit` syscall) but still has entry in process table, (cannot be `kill`ed)
* **System Call** (syscall) = how a program requests a service from OS (eg hardware HDD or camera, creating new processes, kernel services such as process scheduling)

### File System

* **Block** = a **Cluster**
* **Bootloader** (or bootstrap loader) = program responsible for booting a computer & OS, possibly presenting multiple boot choices (aka a **Boot Manager**)
* **Boot Sector** = (usually first) sector of a persistent data storage (eg HDD, floppy, optical disc) which contains machine code to be loaded into RAM then executed by BIOS
* **Cluster** = contiguous aggregation of sectors (as a unit of disk space allocation)
* **Cylinder** = division of data in disk drive
* **File System** (FS) = file organization & access
  * **FAT** (File Allocation Table) = MS-DOS & Windows 9x PC file system, originally for use on flopy disks
  * **exFAT** (Extensible File Allocation Table) = 2006 Microsoft file system optimized for flash memory (eg USB flash drives, SD cards)
  * **NTFS** = proprietary Microsoft journaling file system (à la DB transaction log)
* **GPT** (GUID Partition Table) = standard for layout of partition tables of physical storage devices (part of UEFI)
* **Head** = I/O device that reads/writes data to disks
* **Inode** = Unix-style file system data structure describing file & directory objects (contains their IDs, physical disk location, timestamp metadata)
  * Actual filenames are stored in their parent folder (ie a special type of file), mapped to their inode ID
* **MBR** (Master Boot Record) = **Boot Sector** in first block of partitioned mass storage devices, supporting 32-bit, and up to 4 primary partitions
* [NTFS links](https://en.wikipedia.org/wiki/NTFS_links)
  * **Hard Links** = two _index_ entries point to the same physical file
  * **Junction Points** = hard link for a folder
  * **Symbolic Link** = Windows shortcut = a physical file whose content is the path of another file
* **Sector** = **Track** subdivision (ie an arc), minimum storage unit of a hard drive (4096 bytes for newer HDD/SDDs)
* **Track** = circular path on a disk surface

### Memory

* **Fragmentation** = degradation of memory allocation capability leading to storage inefficiency or impossibility
  * **Internal** = natural space of memory waste due to paging managing fixed-sized slots
  * **External** = remaining free memory is composed of smaller disjointed blocks, preventing larger blocks from being stored
  * **Data** (File System) = stored data is exploded and non-contiguous (due to external fragmentation), leading to poor performance
* **Pages** = units/areas of virtual memory of same size
* **Pages Table** = data structure in memory (RAM) holding mapping between virtual and physical addresses
* **Pages Table Entry** (PTE) = one entry in pages table
* **Page Table Base Register** (PTBR) = CPU register containing (RAM) address of pages table
* **Segment** = permission-protected (read, write, execute) addressable (with an offset) subdivision of memory
  * **Code/Text** = contains executable code (generally read-only & fixed size)
  * **Data** = initialized static variables
  * **BSS** (Block Starting Symbol) = uninitialized static variables & constants
  * **Heap** = dynamically allocated memory (starts after BSS)
  * **Stack** = LIFO structure (grows towards heap) where function call and local variables data gets saved during a process normal execution
* **Segmentation** = divide primary memory (RAM) into segments/sections
* **User space** = memory area where application software and drivers execute (typically one address space per process)
* **Virtual Memory** = technique which lets a process manage its own addresses & memory independently from actual physical memory (mapped to both RAM or HDD)
