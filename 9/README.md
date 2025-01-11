# Membuat Script untuk Menambahkan SSH Key ke ‘authorized_keys’ (SSH)
Buatlah sebuah shell script yang menerima dua parameter: file key public dan username. Script ini harus menambahkan public key ke file ‘~/.ssh/authorized_keys’ dari user yang bersangkutan di server local.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_9.sh
```
Run the script and input the directory 
```bash
./soal_9.sh <public_key_file_location> <username>


```
# Script Result

```bash
ubuntu@ubuntu:~$ ./soal_9.sh /home/ubuntu/pubkey/id_ed25519.pub test_1
Public key has been successfully added for user test_1