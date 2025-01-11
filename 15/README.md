# Monitoring Penggunaan Disk (MONITORING)
Buatlah sebuah shell script yang akan memonitor penggunaan disk pada sistem. Jika penggunaan disk diatas 80%, script harus mengirimkan notifikasi melalui suatu service lain (bebas menggunakan tools apapun untuk notifikasinya).

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_15sh
```
Run the script  
```bash
./soal_15.sh 
```
Run in background
```bash
./soal_15.sh &
```
# Script Result
### Normal Usage (<80%)
```bash
ubuntu@ubuntu:~$ ./soal_15.sh

Filesystem      Size  Used  Avail  Use%  Mounted on
/dev/sda1       100G  60G   40G    60%   /

```
### High Disk Usage (>80%)
```bash
ubuntu@ubuntu:~$ ./soal_15.sh
Filesystem      Size  Used  Avail  Use%  Mounted on
/dev/sda1       100G  85G   15G    85%   /

Sending email notification...
WARNING: High Disk Usage!
Current usage: 85%
Server: hostname
Date: Mon Mar 15 14:30:45 EDT 2024

```