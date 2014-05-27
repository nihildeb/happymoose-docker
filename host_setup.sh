

# Login with public IP
# add a new interface to 10.0.0 VPC subnet and add my EIP
# bind interface to instance
# ssh into public ip
sudo cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/

sudo su -
# enable second nic
cp /etc/network/interfaces.d/eth0.cfg /etc/network/interfaces.d/eth1.cfg
# edit the file

#change ssh to listen on both interfaces
vim /etc/ssh/sshd_config
#confirm
netstat -tulpn

apt-get update && apt-get -y upgrade && apt-get install -y wget curl git make gcc
dpkg -r command-not-found
wget https://raw.github.com/nihildeb/dotfiles/master/init
bash init

#logout and reconnect as root

# fix asymetric routing
echo '2 eth1_rt' >> /etc/iproute2/rt_tables
ip route add default via 10.0.2.1 dev eth1 table eth1_rt
#confirm 
ip route show table eth1_rt

#tell the route table to route traffic with a source of 10.0.2.0/24 via the rt_eth1 
ip rule add from 10.0.2.0/24 lookup eth1_rt prio 1000

# make it permanent in /etc/network/interfaces.d/eth1.cfg
vim /etc/network/interfaces.d/eth1.cfg

auto eth1
iface eth1 inet static
    address 10.0.2.10
    netmask 255.255.255.0
    network 10.0.2.0
    broadcast 10.0.2.255
    up ip route add default via 10.0.2.1 dev eth1 table eth1_rt
    up ip rule add from 10.0.2.0/24 lookup eth1_rt prio 1000

# reboot and everything should work with ec2 and ec3

#install docker
wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O /usr/local/bin/docker
chmod +x /usr/local/bin/docker
docker -d

git clone https://github.com/nihildeb/happymoose-docker.git



# nsenter setup
# from : http://jpetazzo.github.io/2014/03/23/lxc-attach-nsinit-nsenter-docker-0-9/

cd /tmp
curl https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz \
     | tar -zxf-
cd util-linux-2.24
./configure --without-ncurses
make nsenter
cp nsenter /usr/local/bin
