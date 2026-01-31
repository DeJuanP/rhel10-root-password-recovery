### Working recovery sequence (minimal)

mount -o remount,rw /
passwd root
touch /.autorelabel
exit
reboot