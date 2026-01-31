## RHEL 10 Root Password Recovery
## Recovery Method: Root password recovery through GRUB

### Step 1: Interrupt GRUB at Boot
1. Reboot the system
2. At the GRUB menu, select the default boot path
3. Press 'e' to edit the boot parameters

### Step 2: Modify Kernel Parameters
- Locate the line that begins with 'linux', 'linux16', or 'linuxefi'.
- At the in that line append the string 'rd.break' (Key difference between release)

### Step 3: Boot with modified parameters
- Press Ctrl + X to boot with modified configuration
- If prompted for a password, the GRUB was Not interrupted

### Step 4: Reset the Root Password
- Once at the shell prompt:
    - mount -o remount,rw /sysroot (Remounts the root filesystem in read-write mode)
    - chroot /sysroot
    - passwd root

### Step 5: Initiate SELinux Relabel 
- touch /.autorelabel
- Exit and reboot
    - exit
    - reboot