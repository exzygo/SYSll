require_relative 'sysverify'

module CMD
  module Utils
    def execute_command(command, error_key, args = {})
      success = system(command)
      unless success
        error = I18n.t("errors.#{error_key}", **args)
        print_error(error)
      end
    end

    def print_error(error)
      puts "Error Code: #{error[:code]}"
      puts "Error Type: #{error[:type]}"
      puts "Message: #{error[:message]}"
    end
  end

  class CALL
    extend CMD::Utils
    def self.clear
      cmd_clear = SYSll::VERIFY.os == :windows ? 'cls' : 'clear'
      execute_command(cmd_clear, "clear_failed")
    end

    def self.list_files(flags = nil)
      cmd_lf = if SYSll::VERIFY.os == :windows
                'dir'
               else
                 flags.nil? ? "ls" : "ls #{flags}"
               end
      execute_command(cmd_lf, "list_files_failed")
    end

    def self.network_info
      cmd_netinf = SYSll::VERIFY.os == :windows ? 'ipconfig' : 'ifconfig'
      execute_command(cmd_netinf, "network_info_failed")
    end

    def self.process_info
      cmd_process = SYSll::VERIFY.os == :windows ? 'tasklist' : 'ps aux'
      execute_command(cmd_process, "process_info_failed")
    end

    def self.kill_process(pid, flag = nil)
      cmd_kill = if SYSll::VERIFY.os == :windows
                    flag.nil? ? "taskkill /PID #{pid}" : "taskkill /PID #{pid} #{flag}"
                 else 
                    flag.nil? ? "kill #{pid}" : "kill #{flag} #{pid}"
                 end
      execute_command(cmd_kill, "kill_process_failed", pid: pid)
    end

    def self.sys(flags = nil)
      cmd_sys = SYSll::VERIFY.os == :windows ? "systeminfo" : flags.nil? ? "uname" : "uname #{flags}"
      execute_command(cmd_sys, "sys_failed")
    end 
  end

  class KERNEL
    extend CMD::Utils
    DELIMITERS = ["\n"]
    REGSPLIT = Regexp.union(DELIMITERS)
    def self.clear
      krn_clear = SYSll::VERIFY.os == :windows ? Kernel.`("cls") : Kernel.`("clear")
      return krn_clear
    end

    def self.list_files(flags = nil)
      krn_lf = SYSll::VERIFY.os == :windows ? Kernel.`("dir").split(REGSPLIT) : flags.nil? ? Kernel.`("ls").split(REGSPLIT) : Kernel.`("ls #{flags}").split(REGSPLIT)
      return krn_lf      
    end

    def self.network_info
      krn_netinf = SYSll::VERIFY.os == :windows ? Kernel.`("ipconfig").split(REGSPLIT) : Kernel.`("ifconfig").split(REGSPLIT) 
      return krn_netinf
    end

    def self.process_info
      krn_process = SYSll::VERIFY.os == :windows ? Kernel.`("tasklist") : Kernel.`("ps aux").split(REGSPLIT)
      return krn_process
    end

    def self.kill_process(pid, flag = nil)
      krn_kill = if SYSll::VERIFY.os == :windows
                    flags.nil? ? Kernel.`("taskill /PID #{pid}").split(REGSPLIT) : Kernel.`("taskill /PID #{pid} #{flag}").split(REGSPLIT)
                 else
                    flags.nil? ? Kernel.`("kill #{pid}").split(REGSPLIT) : Kernel.`("kill #{flag} #{pid}").split(REGSPLIT)
                 end
      return krn_kill
    end

    def self.sys(flags = nil)
      krn_sys = if SYSll::VERIFY.os == :windows
                  Kernel.`("systeminfo")
                else
                  if flags.nil? 
                    Kernel.`("uname").split(REGSPLIT)
                  else
                    uname_delimiters = ["\n", " "] 
                    reguname = Regexp.union(uname_delimiters)
                    Kernel.`("uname #{flags}").split(reguname)
                  end
                end
      return krn_sys
    end 
  end
end
