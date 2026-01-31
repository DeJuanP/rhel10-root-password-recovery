## RHEL 10 Root Password Recovery

## Background
Explanation of RHEL 8/9 vs RHEL 10 differences

## Lab Environment 
- Hypervisor: QEMU/KVM
- OS: RHEL 10
- Boot Media tested: boot.iso, dvd.iso

## Recovery Method: Root password recovery through GRUB

### Step 1: Interrupt GRUB at Boot
1. Reboot the system
2. At the GRUB menu, select the default boot path
3. Press 'e' to edit the boot parameters

### Step 2: Modify Kernel Parameters
- Locate the line that begins with 'linux' (not 'linux16').
- At the in that line append the string 'init=/bin/bash' (Key difference between release)

### Step 3: Boot with modified parameters
- Press Ctrl + X to boot with modified configuration
- If prompted for a password, the GRUB was Not interrupted

### Step 4: Reset the Root Password
- Once at the shell prompt:
    - mount -o remount,rw /
    - passwd root

### Step 5: Initiate SELinux Relabel 
- touch /.autorelabel
- Exit and reboot
    - exit
    - reboot

## Common Failure Modes in RHEL 10 Recovery
### Emergency Mode Prompt
- If the system displays:
    - 'Give root password for maintenance (or press Control-D to continue):
- This indicates:
    - The kernel parameters were not interpreted as intended
    - The system did not break early enough in the boot process
- Common causes:
    - Incorrect GRUB syntax
    - Parameter placement errors
    - Using legacy parameters from RHEL 8/9 without adjustment

## boot.iso vs DVD ISO Behavior
- Observations:
    - boot.iso requires network access during installation
    - Recovery attempts using boot.iso installs may behave unexpectedly during early boot
    - The full DVD ISO provided more consistent recovery behavior during testing
    - Once installed, system behavior is identical, regardless of installation media

## Recommendations
- The full DVD ISO is recommended to reduce installation and recovery complexity.
- Always verify GRUB syntax against the target RHEL version.
- Do not assume recovery procedures are identical across major RHEL releases.

> Note: Recovery procedures for RHEL 8 and 9 difer slightly.
> See `docs/rhel8-9-root-password-recovery.md` for legacy workflows.