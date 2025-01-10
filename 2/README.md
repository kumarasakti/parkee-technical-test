# Backup dan Kompresi File (MANAGEMENT FILE)
Buatlah sebuah shell script yang akan mem-backup sebuah direktori tertentu dan 
mengompres hasil backup tersebut dengan format .tar.gz. Script harus memiliki 
parameter input untuk menentukan direktori sumber dan lokasi penyimpanan hasil 
backup.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_2.sh
```
Run the script and input 2 parameter
```bash
Usage: ./2.sh <source_directory> <backup_destination>
Example: ./2.sh /home/user/documents /backup/storage
```
# Script Result


```bash
./soal_2.sh /home/ubuntu/grocery /home/ubuntu/backup

Start backup process of '/home/ubuntu/grocery'...
Backup successful!
Backup file is located at '/home/ubuntu/backup/backup_grocery_20250110032844.tar.gz'
with size of 17M

```
## If the directory aren't exist
```bash
./soal_2.sh /home/ubuntu/apple /home/ubuntu/backup
Error: Directory '/home/ubuntu/apple/' does not exist
```
```bash
./soal_2.sh /home/ubuntu/grocery /home/ubuntu/bkup
Error: Directory '/home/ubuntu/bkup' does not exist
```
