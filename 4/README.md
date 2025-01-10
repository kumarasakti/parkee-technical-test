# Backup dan Kompresi File (MANAGEMENT FILE)
Buatlah sebuah shell script yang akan melakukan membackup sebuah direktori tertentu dan menghapus backup yang lebih lama dari 7 hari. Script harus memiliki parameter untuk menentukan direktori sumber dan direktori tujuan backup.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_4.sh
```
Run the script and input 2 parameter
```bash
./soal_4.sh <source_directory> <backup_destination>
```
# Script Result

```bash
ubuntu@ubuntu:~$ ./soal_4.sh grocery backup
Start backup process of 'grocery'...
Backup successful!
Backup file is located at 'backup/backup_grocery_20250110105622.tar.gz'
with size of 17M
Cleaning up backups older than 7 days...
Cleanup completed. 3 backup files remaining.
```
## If the directory aren't exist
```bash
ubuntu@ubuntu:~$ ./soal_4.sh apple backup
Error: Directory 'apple' does not exist
```
```bash
ubuntu@ubuntu:~$ ./soal_4.sh grocery bkup
Error: Directory '/home/ubuntu/bkup' does not exist
```