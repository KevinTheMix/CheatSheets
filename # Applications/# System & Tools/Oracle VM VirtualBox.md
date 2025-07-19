# Oracle VM VirtualBox

* Enable Virtualization in BIOS/UEFI Advanced CPU settings
* Create a VM (pick the correct X86/x64 OS)
* To run an ISO, go to Settings > Storage, pick empty disk drive and browse to ISO file
* **Guest Additions** = enable network driver (for file/folder sharing) & 3D acceleration (**requires 128+/256 MB of video memory**)
  * Devices > _Install Guest Additions_ loads a virtual CD drive disk, then launch it & run the appropriate exe
  * For file sharing, it's also possible to pass files to the guest VM via copy-pasting or via a USB key
* Most exe files cannot be run from shared folder and have to be copied to VM (virtual) local drive first
  * [VirtualBox forum - Shared folder path not found](https://forums.virtualbox.org/viewtopic.php?t=87976)
