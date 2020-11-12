Update your system: \
`sudo apt update && sudo apt upgrade`

# Add Swap File (or use add-swapp.sh)
Create: \
`sudo fallocate -l 1G /swapfile`

Cleanup: \
`sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576`

Make readable by root only: \
`sudo chmod 600 /swapfile`

Make it swap: \
`sudo mkswap /swapfile`

Turn it on: \
`sudo swapon /swapfile`

Edit fstab: \
`echo "/swapfile swap swap deafults 0 0" | sudo tee -a /etc/fstab`

Verify if fstab edits don't have missspellings: \
`sudo mount -a`

Verify you got swap file: \
`htop`

# Install Docker (or use install-docker.sh)
Add docker GPG key: \
`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

Add repository: \
`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`

Remove old docker if any: \
`sudo apt-get remove docker docker-engine docker.io containerd`

Update dep and install docker: \
`sudo apt-get update` \
`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose`

Enable docker on startup: \
`sudo systemctl enable docker`

Start docker: \
`sudo systemctl start docker`

# Basic Server Security 
## Firewall (or use enable-ufw.sh):
Limit ssh failed connections: \
`sudo ufw limit ssh`

Open web trafic:  \
`sudo ufw allow 80/tcp && sudo ufw allow 443/tcp`

Disable outgoing connections by default: \
`sudo ufw default deny incoming`

Allow outgoing trafic by default: \
`sudo ufw default allow outgoing`

Enable firewall (not in the script): \
`sudo ufw enable`

Check firewall status:  \
`sudo ufw status`

Which ports are exposed: \
`netstat -tunlp` 

## Update SSH Config
Edit ssh config: \
`sudo nano /etc/ssh/sshd_config`

In there change: \
`PermitRootLogin no` \
`PasswordAuthentication no` \
`ChallengeResponseAuthentication no` \
`UsePAM no # if on AWS leave this yes as it gives you pem`

Restart your ssh service: \
`sudo systemctl restart sshd`

## Update Sysctl Config
Edit Config: \
`sudo nano /etc/sysctl.conf`

Enable spoof protection: \
`net.ipv4.conf.default.rp_filter=1` \
`net.ipv4.conf.all.rp_filter=1`

Block ping requests & prevent man in the middle attacks: \
`net.ipv4.conf.all.accept_redirects = 0` \
`net.ipv6.conf.all.accept_redirects = 0`

Some other suggested ones: \
`net.ipv4.conf.all.send_redirects = 0` \
`net.ipv4.conf.all.accept_source_route = 0` \
`net.ipv6.conf.all.accept_source_route = 0` \
`net.ipv4.conf.all.log_martians = 1`