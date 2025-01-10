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
ubuntu@ubuntu:~$ sudo ./system-updates.sh
[2025-01-10 10:54:58] Starting system update...
[2025-01-10 10:54:58] System Information:
[2025-01-10 10:54:58] Detected package manager: apt
[2025-01-10 10:54:58] Updating package lists...

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://id.archive.ubuntu.com/ubuntu noble InRelease
Get:2 http://id.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
Get:3 http://id.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
...
Fetched 6,132 kB in 7s (900 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
206 packages can be upgraded. Run 'apt list --upgradable' to see them.
[2025-01-10 10:55:24] Upgrading packages...
...
[2025-01-10 11:09:08] Cleaning up...
[2025-01-10 11:09:23] System update completed successfully
```