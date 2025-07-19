# OS

## Glossary

* **Console** = physical keyboard/display/teletype directly attached to a computer, that receives kernel messages an login prompts
* **Copy-on-Write** (COW) = shared data resource management technique, used for virtual memory management and computer storage (flesystems/DBs)
  * For VM = when `fork`-ing, child process don't immediately get a new physical copy of its parent's memory, instead kernel intercepts first write operation attempt and allocate a physical page then
    * That is because most fork children do not modify any memory and immediately execute a new process, so they often can just read(-only) from their parent's memory, thereby avoiding unnecessary memory allocation
  * For storage = similar to journaling, instead of overwriting existing data immediately, first create a new copy when changes are made, while keeping original (allows snapshot-like history)
* **Fork** = clones a new process (returns new child _PID_ in parent and _0_ in child itself)
* **Kernel** = OS core with complete control over everything, always resides in memory, handles hardware resources via device drivers, file system, network sockets
* **Kernel Space** = strictly protected to run a privileged OS kernel, kernel extensions & device drivers
* **Kernel Stack** = OS memory space where interrupted process context gets saved to be restored eventually
* **Process** = program instance being executed in memory
  * **Daemon** = program running as a background process (eg Windows service, Unix utilities _syslogd_, _sshd_, _cron_)
  * **Orphan** = process whose parent has finished/terminated but remains running itself
  * **Zombie** = completed execution (via `exit` syscall) but still has entry in process table, (cannot be `kill`ed)

* **System Call** (syscall) = how a program requests a service from OS (eg hardware HDD or camera, creating new processes, kernel services such as process scheduling)
* **Trap** = a way (imilar to interrupts) for kernel to regain control when a process performs an illegal operation (eg divide by 0) so that it can handle it (eg kill it)
* **User Space** (or **User-land** or **User Mode**) = everything a program can touch while CPU is running in _user_ mode (ring 3 on x86 ie lower priviledges)

### File System

* **Block** = smallest unit of data a FS or disk uses to read/write (like pages in a book)
* **Block Pointer** = FS-level references to block of data within FS address space (can be direct/indirect ie linked-lists-like), mapped to LBAs by OS using FS specific layout information
* **Bootloader** (or bootstrap loader) = program responsible for booting a computer & OS, possibly presenting multiple boot choices (aka a **Boot Manager**)
* **Clobber(ing)** = overwriting (a file)
* **File Handle** (Windows) = opaque pointer-sized HANDLE (`void*` or `uintptr_t`)
* **File System** (FS) = file organization & access
  * **FAT** (File Allocation Table) = MS-DOS & Windows 9x PC file system, originally for use on flopy disks
  * **exFAT** (Extensible File Allocation Table) = 2006 Microsoft file system optimized for flash memory (eg USB flash drives, SD cards)
  * **NTFS** = proprietary Microsoft journaling file system (à la DB transaction log)
* **GPT** (GUID Partition Table) = standard for layout of partition tables of physical storage devices (part of UEFI)
* **Inode** = Unix-style file system data structure describing file & directory objects (ID, (timestamp) metadata, permissions, physical disk location)
  * Physical disk location is indirectly provided via Inode **Block Pointer**s referencing a **Logical Block Address**es (LBA) usable by disk firmware
  * File names are not stored in Inode but in file parent folder/directory (ie a special type of file mapping files names to Inode IDs)
* **Inode Table** = Kernel-managed mapping of inodes to their content on disk
* Links
  * [NTFS links](https://en.wikipedia.org/wiki/NTFS_links)
  * **Hard Link** = directory entry associating a name with a file (there can be multiple entries pointing to same physical file, ie another name to same inode)
    * **Junction Points** = hard link for a folder (hard links to directories are usually not permitted as they can cause a circular structure and interferences with programs)
  * **Soft Link** or **Symbolic Link** = file whose content is a (filesystem) path to another (potentially now moved/erased) file (eg Windows shortcut file)
* **Logical Block Address** (LBA) = address provided by OS to disk controller to read/write a physical location
  * Physical disk location is hidden from OS (disk controller itself manages its internal storage, providing features such as wear leveling)
* **Journaling** = crash-consistency using a write-ahead log/journal where sets of planned updates are first written
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
  * **Stack** = LIFO structure (grows towards heap) where local (function) variables are saved (eg fixed-sized array buffers)
    * **Stack Frame** = block of data created when a function is called (return address, local variables, arguments, etc)
* **Memory Management Unit** (MMU) = CPU electronic component that translates virtual into physical addresses (using mapping page tables in RAM pointed to via a register)
  * Only the CPU can touch wires this fast—nanoseconds per memory access—so the MMU has to live right inside the core
  * **TLB** (Translation Look-aside Buffer) = tiny very-fast cache inside MMU that stores recent results of page-table walks
* **Memory-Mapped File** = segment of virtual memory assigned a direct byte-for-byte correlation with some file(-like) resource portion
  * File is any resource OS can reference through a file descriptor (eg disk file, shared memory, device)
* **Memory Segmentation** = hardware-level mechanism by older CPU to add base + limit to every address, dividing memory into atomic segments of varying sizes, can cause free memory fragmentation
  * That is achieved via segment registers (CS code, DS data, SS stack), largely replaced with paging on modern 64-bits CPU/OS
  * Segments, like page, are addressable (via a segment selector & an offset) and can be swapped in/out from/to disk
* **User space** = memory area where application software and drivers execute (typically one address space per process)
* **Virtual Address Space** = a process's internal private coordinate system for memory (starting at 0 internally)
* **Virtual Byte** = a byte of virtual memory (ie from viewpoint of a process)
* **Virtual Memory** = mechanism which lets a process manage its internal address space as a contiguous address space, independently from their physical locations
  * Uses pagination/segmentation techniques to map to either physical RAM or HDD, or nothing yet (page is not present, first access will cause kernel to allocate or load it)
* **Wear Leveling** = technique used by SSDs type drive to spread write/erase cycles over all physical flash cells

#### Paging

* **Memory Paging** = divides a process address space into small fixed-sized chunks that can be swapped in/out to RAM/disk, but can cause process fragmentation
* **Page (Frame)** = small (kernel/only user permitted) area of virtual memory of same size (eg 4K), not necessarily aligned with segment boundaries
* **Page Table** = data structure residing in memory (ie so MMU can access it) mapping virtual (a process internal addresses) and physical addresses (in RAM and/or disk)
* **Page Table Entry** (PTE) = one entry in pages table
* **Page Table Base Register** (PTBR) = CPU register containing (RAM) address of pages table
