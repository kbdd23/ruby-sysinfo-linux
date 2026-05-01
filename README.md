# ruby-sysinfo-linux
A lightweight tool to extract OS, CPU, RAM, and storage structure from Linux systems via /proc /etc and lsblk commands.

---

## Installation & Usage
1.**Clone the repository**:

git clone https://github.com/kbdd23/ruby-sysinfo-linux.git
cd ruby-sysinfo-linux
(or copy the systeminfo.rb file content in a ruby file)

2.**Run the script**:

ruby systeminfo.rb

*Note: Ensure you have `lsblk` installed and you are running this on a Linux-based system to allow the script to access `/proc` and `/etc` files. If not, this may broke.*
