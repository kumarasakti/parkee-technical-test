# Copy SSH Public Key to Remote Server (SSH)

Buatlah sebuah shell script `yang menerima tiga parameter: file public key, username, dan ip address server. Script ini harus menyalin public key ke server remote untuk memungkinkan user lain untuk melakukan ssh tanpa password.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_7.sh
```
Run the script and input the public key (if on some directory write the full path) remote server username and the remote server IP address 
```bash
ubuntu@ubuntu:~$ ./soal_7.sh /home/ubuntu/pubkey/id_ed25519.pub ubuntu 192.168.56.10
```
# Script Result
```bash
ubuntu@ubuntu:~$ ./7.sh /home/ubuntu/pubkey/id_ed25519.pub ubuntu 192.168.56.10
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ubuntu/pubkey/id_ed25519.pub"
The authenticity of host '192.168.56.10 (192.168.56.10)' can't be established.
ED25519 key fingerprint is SHA256:EiG+5iTmkH3PdSjxEVfOcLhRky6U94nBgp1OCw/D4jI.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ubuntu@192.168.56.10's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ubuntu@192.168.56.10'"
and check to make sure that only the key(s) you wanted were added.

Public key has been successfully copied to ubuntu@192.168.56.10
```