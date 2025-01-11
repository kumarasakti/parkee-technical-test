# Membuat Script untuk Menambahkan SSH Key ke ‘authorized_keys’ (SSH)
Buatlah sebuah shell script yang membuat sebuah file systemd untuk menjalankan script python sederhana. File ini harus ditempatkan di folder `/etc/systemd/system/`. Script python harus dijalankan sebagai service yang dapat dijalankan, dihentikan dan di cek status service tersebut menggunakan systemctl.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_13.sh
```
Run the script using root user or just use sudo
```bash
sudo ./soal_13.sh 
```
# Script Result

```bash
ubuntu@ubuntu:~$ sudo ./soal_13.sh
Service has been created and started
Use these commands to manage the service:
systemctl start sample_service
systemctl stop sample_service
systemctl status sample_service

ubuntu@ubuntu:~$ sudo systemctl status sample_service
● sample_service.service - Sample Python Service
     Loaded: loaded (/etc/systemd/system/sample_service.service)
     Active: active (running)
```