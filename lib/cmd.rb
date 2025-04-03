require_relative 'sysverify'

module CMD
  class CALL
    def self.clear
      case SYSll::VERIFY.os
      when :windows
        system('cls')
      else
        system('clear')
      end
    end

    def self.list_files(flags = nil)
      case SYSll::VERIFY.os
      when :windows
        system('dir')
      else
        if flags.nil?
          system("ls")
        else
          system("ls #{flags}")
        end
      end
    end

    def self.network_info
      case SYSll::VERIFY.os
      when :windows
        system('ipconfig')
      else 
        system('ifconfig')
      end
    end

    def self.process_info
      case SYSll::VERIFY.os
      when :windows
        system("tasklist")
      else 
        system("ps aux")
      end
    end

    def self.kill_process(pid, flag = nil)
      case SYSll::VERIFY.os
      when :windows
        if flags.nil?  
          system("taskkill /PID #{pid}")
        else 
          system("taskkill /PID #{pid} #{flag}")
        end
      else
        if flags.nil?
          system("kill #{pid}")
        else 
          system("kill #{flag} #{pid}")
        end
      end
    end

    def self.sys(flags = nil)
      case SYSll::VERIFY.os
      when :windows
        system("systeminfo")
      else
        if flags.nil? 
          system("uname")
        else
          system("uname #{flags}")
        end
      end
    end 
  end
end
