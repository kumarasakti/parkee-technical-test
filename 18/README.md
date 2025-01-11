# Konfigurasi Jaringan dengan ‘netplan’ (NETWORK)
Buatlah sebuah shell script yang mengkonfirmasi jaringan menggunakan ‘netplan’. 
Script ini harus mengatur ip address pada interface network ‘eth0’ dengan detail berikut:
 1. IP Address : 192.168.1.100’
 2. Gateway: ‘192.168.1.1’
 3. DNS: ‘8.8.8.8’ dan ‘8.8.4.4’

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_18.sh
```
Run the script using root user or just use sudo
```bash
sudo ./soal_18.sh
```
# Script Result

```bash
ubuntu@ubuntu:~$ sudo ./soal_18.sh
Network configuration has been applied
----------------------------------------
Network Summary:
IP Address: 192.168.1.100
Gateway   : 192.168.1.1
DNS       : 8.8.8.8, 8.8.4.4
----------------------------------------
```
