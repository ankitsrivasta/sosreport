#!/bin/bash
host="$(hostname)"

sos_dir="/tmp/${host}_sosreport"
mkdir $sos_dir
cd $sos_dir
systemctl list-dependencies > chkconfig
date > date
df > df
dmesg > dmesg
dmidecode > dmidecode  
fdisk -l 1>/dev/null  > fdisk 2>/dev/null  
free > free  
hostname --fqdn > hostname  
ifconfig > ifconfig  
lsmod > lsmod  
lspci > lspci  
cat /proc/mounts > mount  
netstat -tlpn > netstat  
ps auxww > ps  
rpm -qa > rpm-qa  
rpm -Va > rpm-Va     #this command may take a while to run  
ulimit -a > ulimit  
uname -a > uname  
uptime > uptime  
cat /proc/meminfo > meminfo  
cat /proc/cpuinfo > cpuinfo  
mkdir etc  
cd etc  
cp /etc/fstab .
cp /etc/cluster.conf .
cp /etc/security/limits.conf .  
cp /etc/redhat-release .  
cp /etc/sysctl.conf .  
cp /etc/modprobe.conf .  
mkdir sysconfig/network-scripts -p  
cd sysconfig  
cp /etc/sysconfig/* . -R  
cd $sos_dir
mkdir var/log -p  
cp /var/log/* var/log -R  
cd /tmp  
tar -cvjf ${host}_sosreport.tar.bz2 $sos_dir