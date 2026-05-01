# ruby-sysinfo-linux
A lightweight tool to extract OS, CPU, RAM, and storage structure from Linux systems via /proc /etc and lsblk commands using Ruby.

---

## Installation & Usage
1.**Clone the repository**:
```bash
git clone https://github.com/kbdd23/ruby-sysinfo-linux.git
```
```bash
cd ruby-sysinfo-linux
```

*(or copy the systeminfo.rb file content in a ruby file)*

2.**Run the script**:

ruby systeminfo.rb

*Note: Ensure you have `lsblk` installed and you are running this on a Linux-based system to allow the script to access `/proc` and `/etc` files. If not, this may broke.*

## Running
On Linux Mint

<img width="403" height="222" alt="onmint" src="https://github.com/user-attachments/assets/c907f352-26c8-4744-8aad-a79175f7618c" />


On Kali Linux

<img width="433" height="175" alt="onkali" src="https://github.com/user-attachments/assets/8eb55ef0-03b3-4d37-8a63-5040646fbe82" />


## License

MIT License - See **LICENSE** for details.
