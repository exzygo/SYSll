require_relative 'sysverify'
require_relative 'cmd'
require 'i18n'

local_path = File.expand_path("../../locales/*.yml", __FILE__)
I18n.load_path += Dir[local_path]
I18n.default_locale = :en

module SYSll
  class CALL 
    def self.clear
      CMD::CALL.clear
    end

    def self.list_files(flags = nil)
      CMD::CALL.list_files(flags)
    end

    def self.network_info
      CMD::CALL.network_info
    end

    def self.process_info
      CMD::CALL.process_info
    end

    def self.kill_process(pid, flag = nil)
      CMD::CALL.kill_process(pid, flag)
    end

    def self.sys(flags = nil)
      CMD::CALL.sys(flags)
    end 
  end

  class KERNEL
    def self.clear
      CMD::KERNEL.clear
    end

    def self.list_files(flags = nil)
      CMD::KERNEL.list_files(flags)
    end

    def self.network_info
      CMD::KERNEL.network_info
    end

    def self.process_info
      CMD::KERNEL.process_info
    end

    def self.kill_process(pid, flag = nil)
      CMD::KERNEL.kill_process(pid, flag)
    end

    def self.sys(flags = nil)
      CMD::KERNEL.sys(flags)
    end 
  end
end
