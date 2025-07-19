# Hardware

## Glossary

* **BIOS** (Basic Input/Output System) = de-facto firmware standard, performing hardware initialization during booting process, and providing runtime services for OS & programs
  * **GPT** (GUID Partition Table)
  * **POST** (Power-On Self-Test) = process performed by firmware/software immediately after computer is powered on
  * **UEFI** (Unified Extensible Firmware Interface) = firmware architecture open standard/specification
* **Bus** = data communication system between components inside or between computers
* **Controller** = hardware chip/component managing communication between CPU (high-level operation) & peripheral (device-specific) operations, handling low-level details (timing, buffering, protocol management)
* **CPU Ring** = privilege level (eg _0_ for full hardware authority for kernel code, less for higher numbers)
* **Driver** = software program allowing OS communication with hardware devices through their controller, exposing a standard interface for OS to pilot device-specific details
* **Firmware** = a device's controller embedded software
* **Peripheral** = device such as disk & USB controllers, peripherals, network cards
* **System Bus** = single BUS connecting marjor components, combiging functions of data (information), address (where from/to) & control (which operation)
  * **Address** = address of RAM or I/O devices for usage by CPU
  * **Data** = data words being read/written between CPU & RAM/devices
  * **Control** = timing & control signals (read/write, interrupts, clock, etc)

* _Arduino_ = single-board microcontrollers (by open-source hard/software Italian company)
* _Raspberry Pi_ = single board computers (SBC)

### Disk & Storage

* **Boot Sector** = (usually first) sector of a persistent data storage (eg HDD, floppy, optical disc) which contains machine code to be loaded into RAM then executed by BIOS
* **Cluster** (aka **Block**) = contiguous aggregation of sectors (as a unit of disk space allocation)
* **Cylinder** = division of data in disk drive
* **Head** = I/O device that reads/writes data to disks
* **MBR** (Master Boot Record) = **Boot Sector** type in first block of partitioned mass storage devices for IBM PC-compatible systems (32-bit & up to 4 primary partitions)
* **NVMe** (Non-Volatime Memory Express) = open logical-device interface specification for non-volatile storage media, usually NAND flash memory via PCI Express bus
* **Sector** = **Track** subdivision (ie an arc), minimum storage unit of a hard drive (4096 bytes for newer HDD/SDDs)
* **Track** = circular path on a disk surface
