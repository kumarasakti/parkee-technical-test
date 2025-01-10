# Pencarian File Berdasarkan Ekstensi File (MANAGEMENT FILE)
Buatlah sebuah shell script yang menerima dua parameter: direktori dan ekstensi file. Script ini harus mencari semua file dengan ekstensi yang diberikan di dalam direktori  tersebut dan menampilkan daftar nama file yang ditemukan.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_1.sh
```
Run the script and input 2 parameter
```bash
Usage: ./soal_1.sh <directory> .<file_extension>
```
# Script Result

If the file are found and the directory valid

```bash
./soal_1.sh /home/ubuntu .txt
Files with extension '.txt' found in '/home/ubuntu/':
- apple.txt
- ball.txt
- grocery.txt

```
If the directory aren't exist
```bash

Error: Directory '/home/ubuntu/test' does not exist
```