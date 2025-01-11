# Pengaturan Firewall dengan `iptables` (NETWORK)
Buatlah sebuah shell script yang mengkonfigurasi aturan firewall menggunakan 
‘iptables’, ikuti persyaratan aturan dibawah ini:
 1. Mengizinkan semua koneksi keluar.
 2. Mengizinkan koneksi masuk ke port 22 (SSH), 80 (HTTP), dan 443 (HTTPS).
 3. Menolak semua koneksi masuk lainnya.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_17.sh
```
Run the script using root user or just use sudo
```bash
sudo ./soal_17.sh 
```
# Script Result

```bash
ubuntu@ubuntu:~$ ./soal_17.sh
Starting firewall configuration...
Flushing existing firewall rules...
✓ Existing rules flushed
Setting default policies...
✓ Default policies set: INPUT/FORWARD -> DROP, OUTPUT -> ACCEPT
Configuring loopback interface...
✓ Loopback interface configured
Allowing established and related connections...
✓ Established and related connections allowed
Opening port 22 for SSH...
✓ SSH port (22) opened
Opening port 80 for HTTP...
✓ HTTP port (80) opened
Opening port 443 for HTTPS...
✓ HTTPS port (443) opened
Saving firewall rules...
✓ Firewall rules saved successfully to /etc/iptables/rules.v4

Firewall configuration completed successfully!
Summary of open ports:
- SSH (22)
- HTTP (80)
- HTTPS (443)
```
