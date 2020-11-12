# remove old docker 
sudo apt-get remove docker docker-engine docker.io containerd
# add docker GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add repository:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# update dep and install docker:
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
# enable docker on startup: 
sudo systemctl enable docker
# start docker: 
sudo systemctl start docker