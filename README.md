# SYSll - Cross-Platform System Commands for Ruby
[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE) ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) 

<div align="center"><br>
  <a href='https://postimg.cc/vxZ5x9p2' target='center'><img src='https://i.postimg.cc/vxZ5x9p2/SYSll-removebg-preview.png' border='0' alt='SYSll-removebg-preview' width="250em"/></a>
</div><br>

**SYSll** is a robust Ruby gem offering a unified interface for executing low-level system commands across different operating systems, including Linux, macOS, Windows and Unix-based systems. It intelligently adapts commands based on the user’s OS, providing seamless cross-platform compatibility.

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

# USAGE

```ruby
require 'sysll'

# Clear terminal
SYSll.clear

# List files (with optional flags on Unix systems)
SYSll.list_files
SYSll.list_files('-la')

# Show network info
SYSll.network_info

# Show process info
SYSll.process_info

# Kill a process by PID (with flags)
SYSll.kill_process(1234)
SYSll.kill_process(1234, '/F') # For WINDOWS systems
SYSll.kill_process(1234, '-9') # For UNIX systems

# System information (with opitional flags on Unix systems)
SYSll.sys
SYSll.sys('-a')
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

```
gem build sysll.gemspec
gem push sysll-0.1.0.gem
```

<br>

# CONTRIBUTING

Feel free to fork, create issues, and submit pull requests. Contributions are welcome!
