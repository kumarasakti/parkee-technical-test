# Membuat Script untuk Menambahkan SSH Key ke ‘authorized_keys’ (SSH)
Buatlah sebuah shell script yang menerima dua parameter: file key public dan username. Script ini harus menambahkan public key ke file ‘~/.ssh/authorized_keys’ dari user yang bersangkutan di server local.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_12.sh
```
Run the script and input the directory 
```bash
./soal_12.sh <source_file> <username> <remote_ip>


```
# Script Result

## If success
```bash
ubuntu@ubuntu:~$ ./soal_12.sh myfile.txt ubuntu 192.168.56.10
Performing SCP transfer...
File successfully transferred using SCP

Performing RSYNC transfer...
sending incremental file list
myfile.txt
            152 100%    0.00kB/s    0:00:00
sent 258 bytes  received 35 bytes  586.00 bytes/sec
total size is 152  speedup is 0.52
File successfully transferred using RSYNC

```

## If failed
### Failed Transfer (File doesn't exist)
```bash
ubuntu@ubuntu:~$ ./soal_12.sh apple.txt ubuntu 192.168.56.10
Performing SCP transfer...
Source file does not exist

Performing RSYNC transfer...
Source file does not exist
```