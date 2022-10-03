# Reinstall grub from live environment

## Find EFI partition
fdisk -l
(nvme0n1p1 in this file)

(nvme0n1p5 is the ext2/3/4 where the linux lives)

## Mount
sudo mount /dev/nvme0n1p5 /mnt

sudo mount --bind /dev /mnt/dev &&
sudo mount --bind /dev/pts /mnt/dev/pts &&
sudo mount --bind /proc /mnt/proc &&
sudo mount --rbind /sys /mnt/sys &&
sudo mount /dev/nvme0n1p1 /mnt/boot/efi

chroot /mnt

grub-install /dev/nvme0n1p5


exit && sudo umount /mnt/sys && sudo umount /mnt/proc && sudo umount /mnt/dev/pts && sudo umount /mnt/dev && sudo umount /mnt/boot/efi

