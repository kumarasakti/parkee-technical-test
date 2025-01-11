# Menghapus SSH Key dari ‘authorized_keys’ (SSH)
Buatlah sebuah shell script yang menerima dua parameter: string yang unique dari key public dan username. Script ini harus menghapus public key yang mengandung string unique tersebut dari file ‘~/.ssh/authorized_keys’ dari user yang bersangkutan.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_10.sh
```
Run the script and input the directory 
```bash
./soal_10.sh <unique_string> <username>

```
# Script Result

```bash
ubuntu@ubuntu:~$ ./soal_10.sh test_1@ubuntu
Public key containing 'test_1@ubuntu' has been removed for user test_1