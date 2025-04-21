# SYSll - Cross-Platform System Commands for Ruby
[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE) ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) 

<div align="center"><br>
  <a href='https://postimg.cc/vxZ5x9p2' target='center'><img src='https://i.postimg.cc/vxZ5x9p2/SYSll-removebg-preview.png' border='0' alt='SYSll-removebg-preview' width="250em"/></a>
</div><br>

**SYSll** is a robust Ruby gem offering a unified interface for executing low-level system commands across different operating systems, including Linux, macOS, Windows, Unix-based systems and Android. It intelligently adapts commands based on the user’s OS, providing seamless cross-platform compatibility.

<br>

# FEATURES

  - **Cross-platform Command Abstraction:** Dynamically handles OS-specific commands for consistent behavior.

  - **Adaptive OS Detection:** Automatically detects the operating system and selects appropriate syscalls.

  - **Extensible API Surface:** Exposes a concise yet powerful API for system interactions.

  - **Graceful Error Handling:** Implements fail-safes for invalid commands or restricted permissions.

<br>

# INSTALLATION

Add this line to your Gemfile:

```ruby
# Using Bundler
gem 'sysll', git: 'https://github.com/fasmagoric/SYSll'
```

Or install it with gem:

```ruby
gem install sysll
```

<br>

# ARCHITECTURE

The architecture is modular and static, designed for reusability and maintainability.

## Module: SYSll

This is the gem’s entry point. It exposes two main classes:

 - **SYSll::CALL** = Executes system commands using system, with direct terminal output

 - **SYSll::KERNEL** = Return the commands using `cmd`, communicating directly with the kernel and returning the output in an array or a string parsed and formated.

<br>

# USAGE

## SYSll::CALL usages

```ruby
require 'sysll'

# Clear terminal
SYSll::CALL.clear

# List files (with optional flags on Unix systems)
SYSll::CALL.list_files
SYSll::CALL.list_files('-la')

# Show network info
SYSll::CALL.network_info

# Show process info
SYSll::CALL.process_info

# Kill a process by PID (with flags)
SYSll::CALL.kill_process(1234)
SYSll::CALL.kill_process(1234, '/F') # For WINDOWS systems
SYSll::CALL.kill_process(1234, '-9') # For UNIX systems

# System information (with opitional flags on Unix systems)
SYSll::CALL.sys
SYSll::CALL.sys('-a')
```

## SYSll::KERNEL usages

```ruby
require 'sysll'

clear = SYSll::KERNEL.clear
print clear
# OUTPUT: ["\e[H\e[2J\e[3J"]

list_files = SYSll::KERNEL.list_files
list_files_flag = SYSll::KERNEL.list_files('-la')
my_folder = SYSll::KERNEL.list_files('-a')[4]

print "Thats the list of files:\n"
print list_files
print "\n\nThats my test folder:\n"
print my_folder
print "\n\nThats the list of files with the flag '-la':\n"
print list_files_flag
# OUTPUT:
# Thats the list of files:
# ["Gemfile", "Gemfile.lock", "test_folder", "test.rb"]
#
# Thats my test folder:
# test_folder
#
# Thats the list of files with the flag '-la':
# ["total 12", "drwxr-xr-x. 1 mavic mavic  74 abr 13 11:48 .", "drwxr-xr-x. 1 mavic mavic 378 abr 13 05:54 ..", "-rw-r--r--. 1 mavic m
# avic  43 abr 12 05:17 Gemfile", "-rw-r--r--. 1 mavic mavic 239 abr 13 11:33 Gemfile.lock", "drwxr-xr-x. 1 mavic mavic   0 abr 13 11:
# 36 test_folder", "-rw-r--r--. 1 mavic mavic 337 abr 13 11:48 test.rb"]⏎                                                             
 
my_os = SYSll::KERNEL.sys('-a')[0..1]
print my_os
# OUTPUT:
# ["Linux", "fedora"]
```

<br>

# DEVEL

Clone the repository and install dependencies:

```ruby
git clone https://github.com/fasmagoric/SYSll.git
cd SYSll
bundle install
```
and to build and push:

```ruby
gem build sysll.gemspec
gem push sysll-0.1.0.gem
```

<br>

# CONTRIBUTING

Feel free to fork, create issues, and submit pull requests. Contributions are welcome!
