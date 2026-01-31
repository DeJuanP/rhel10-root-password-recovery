## Overview
While practicing system recovery task, I worked on resetting the root account password on Red Hat Enterprise Linux 10. Although the recovery workflow is similiar to RHEL 8 and RHEL 9, RHEL 10 introduces subtle but important changes particularly in GRUB syntax and early boot behavior. This repository documents those differences and hightlights how root pasword recovery varies across RHEL versions and depending on the installation media used.

## Scope
The goal of this lab is to provide practical insight for administrators who manage or transition between multiple RHEL releases and need predictable, repeatable recovery procedures

## Key Observations
-The installation experience differs between boot.iso and full DVD ISO (boot.iso requires network access).

-Once RHEL 10 is installed, system behavior is identical regardless of installation media.

-Post-installation tasks such GRUB configuration and root password recovery behave the same on the installed system.

## Recommendations 
-For homelab installations, the full DVD ISO is recommended to avoid network-related installation issues.  However, both ISO types produce an equivalent installed RHEL 10 system.