# limit ssh failed connections:
sudo ufw limit ssh
# open web trafic: 
sudo ufw allow 80/tcp && sudo ufw allow 443/tcp
# disable outgoing connections by default: 
sudo ufw default deny incoming
# allow outgoing trafic by default: 
sudo ufw default allow outgoing

echo "Basic ufw config ran. To enable it run `sudo ufw enable`"
echo "To check ufw status run `sudo ufw status`"