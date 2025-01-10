# Menghitung dan Menampilkan Statistik File (MANAGEMENT FILE)
Buatlah sebuah shell script yang akan menghitung dan menampilkan jumlah baris, kata 
dan karakter dari semua file teks dalam sebuah direktori tertentu. Hasilnya harus 
ditampilkan dalam format table.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_3.sh
```
Run the script and input the directory path
```bash
./soal_3.sh /path/to/directory
```
# Script Result


```bash
./soal_3.sh /home/ubuntu/Documents
======================================
    File Statistics Counter
======================================

FILENAME                                     LINES    WORDS    CHARS
--------------------------------------------------------------------
document1.txt                                 25      150     1250
report.txt                                    100     750     4500
notes.txt                                     50      300     2000
--------------------------------------------------------------------
TOTAL (3 files)                              175     1200     7750
--------------------------------------------------------------------

```
## If the directory aren't exist
```bash
./soal_3.sh /home/ubuntu/whale
======================================
    File Statistics Counter
======================================
Error: Directory '/home/ubuntu/whale' does not exist
```
