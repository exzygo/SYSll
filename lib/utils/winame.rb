exe_file = "winame.exe"
c_file = "winame.c"
if Gem.win_platform?
  File.exist?(exe_file) ? return : system("gcc #{c_file} -o #{exe_file}") 
  IO.popen("./winame.exe", "r") do |io|
    puts io.read
  end
else 
  puts "This script only works on Windows OS and PowerShell"
end
