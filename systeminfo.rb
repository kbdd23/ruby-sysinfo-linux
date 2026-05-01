def get_os()
    if File.exist?("/etc/os-release")
        info = File.read("/etc/os-release").scan(/^(\w+)="?(.*?)"?$/).to_h
        return "#{info["NAME"]} #{info["VERSION"]}"
    else
        return "Unknown OS"
    end
end

def get_cpu()
    if File.exist?("/proc/cpuinfo")
        cpuinfo = File.read("/proc/cpuinfo").scan(/^model name\s+:\s+(.+)$/).flatten.first
        return cpuinfo
    else
        return "Couldn't catch."
    end
end

def get_ram()
    if File.exist?("/proc/meminfo")
        meminfo = File.read("/proc/meminfo").scan(/^(\w+):\s+(\d+)\s+kB$/).to_h
        total_ram_gb = meminfo["MemTotal"].to_i / 1024.0 / 1024.0
        return total_ram_gb.round(2)
    else
        return "Couldn't catch."
    end
end

def get_storage()
    command = %x{lsblk -dbn -o NAME,SIZE,RM} 
    disks = command.split("\n").map do |line| #let's 
        name, size, rm = line.split
        [name, size.to_i, rm.to_i] #convert to int for easier comparison
    end
    #name       #method       #what  #characteristic 
    internal = disks.select { |disk| disk[2] == 0 } # We're defining what we found in arrays.
    external = disks.select { |disk| disk[2] == 1 } # RM=0 means it's an internal disk, RM=1 means it's an external disk.
    
    return "No internal disks found." if internal.empty? 

    big_one = internal.max_by { |disk| disk[1] } # Get the disk with the largest size in the internal disks array.
    size_gb = big_one[1] / 1024.0**3 # Convert bytes to GB
    
    report = "Largest Disk: #{big_one[0]} (#{size_gb.round(2)} GB)"

    return report, big_one #the result an the extra data. (if there's any)
end

def main()
    report, main_disk = get_storage()
    puts "OS:      #{get_os}"
    puts "RAM:     #{get_ram} GB"
    puts "CPU:     #{get_cpu}"
    puts "Storage: #{report}"
    puts "--------------------------------------"
    if main_disk
        puts %x{lsblk -o NAME,SIZE,MOUNTPOINT /dev/#{main_disk[0]}}
    end
end

main()