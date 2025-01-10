# Automasi Pembaharuan Sistem (BASIC SYSTEM)
Buatlah sebuah shell script yang akan secara otomatis memperbaharui semua package di sistem menggunakan package manager yang sesuai dengan family linux (misal ‘apt’,‘yum’ atau sebagainya). Script harus juga mencatat hasil dari setiap pembaruan kedalam sebuah file log.

# How to Use
Just add the execution permission to run the script 
```bash
chmod +x soal_5.sh
```
Run the script and use root user or sudo
```bash
Usage: ./soal_5.sh
```
# Script Result

If the file are found and the directory valid

```bash
ubuntu@ubuntu:~$ sudo ./soal_5.sh
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
....
[2025-01-10 11:09:23] System update completed successfully
```