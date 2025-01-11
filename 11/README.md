# Pengelolaan Service (SERVICE)
Buatlah sebuah shell script yang dapat memulai, menghentikan, dan memeriksa status dari sebuah service tertentu di sistem. Script harus memiliki parameter untuk 
menentukan tindakan yang diinginkan (start, stop, status) dan nama service.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_11.sh
```
Run the script, decide the action and the service name. To start or stop need run the script as root or just use sudo.
```bash
./soal_11.sh <action> <service_name>
Actions: start, stop, status

```
# Script Result

```bash
ubuntu@ubuntu:~$ ./soal_11.sh status mysql
○ mariadb.service - MariaDB 11.4.2 database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; disabled; preset: disabled)
     Active: inactive (dead)
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
