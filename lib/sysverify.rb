require 'rbconfig'

module SYSll
  class VERIFY
    def self.os
      @os ||= (
        host_os = RbConfig::CONFIG['host_os']
        case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :macosx
        when /linux/
          :linux
        when /solaris|bsd|dragonfly/
          :bsd
        when /android/
          :android
        else
          raise Error::WebDriverError, "unknow os: #{host_os.inspect}"
        end
      )
    end
  end
end
