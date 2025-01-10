# Membuat dan Menyimpan SSH Key (SSH)
Buatlah sebuah shell script yang akan membuat sepasang SSH Key (public dan private) dengan menggunakan ssh-keygen dan menyimpannya di direktori yang ditentukan oleh pengguna sebagai parameter. Jika direktori tidak ada, script harus membuatnya terlebih dahulu.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_6.sh
```
Run the script and input the directory 
```bash
./soal_6.sh /home/ubuntu
```
# Script Result

```bash
ubuntu@ubuntu:~$ ./soal_6.sh /home/ubuntu
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/id_ed25519
Your public key has been saved in /home/ubuntu/id_ed25519.pub
The key fingerprint is:
SHA256:redacted 
The key's randomart image is:
+--[ED25519 256]--+
|=*=   +=++*      |
|+o O o +*B.o     |
|..= + =.++o      |
| + o o E  .      |
|. o . = S        |
|.  o . o .       |
|. o   . o        |
| .   . o .       |
|      o .        |
+----[SHA256]-----+

SSH keys generated successfully:
Private key: /home/ubuntu/id_ed25519
Public key: /home/ubuntu/id_ed25519.pub

Public key:
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ubuntu@ubuntu
```

