# create swapfile:
sudo fallocate -l 1G /swapfile
# cleanup:
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
# make readable by root only
sudo chmod 600 /swapfile
# make it swap:
sudo mkswap /swapfile
# turn it on:
sudo swapon /swapfile
# edit fstab: 
echo "/swapfile swap swap deafults 0 0" | sudo tee -a /etc/fstab
# verify if fstab edits don't have missspellings:
sudo mount -a