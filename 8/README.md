# Mengecheck Koneksi SSH ke Server Remote (SSH)

Buatlah sebuah shell script yang menerima dua parameter: username dan ip address server. Script ini harus mencoba melakukan koneksi SSH ke server remote dan print message yang menunjukan apakah koneksi berhasil atau gagal.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_8.sh
```
Run the script and input the public key (if on some directory write the full path) remote server username and the remote server IP address 
```bash
ubuntu@ubuntu:~$ ./soal_8.sh ubuntu 192.168.56.10
```
# Script Result
```bash
ubuntu@ubuntu:~$ ./soal_8.sh ubuntu 192.168.56.10
Connection successful to 192.168.56.10

```