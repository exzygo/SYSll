Gem::Specification.new do |s|
  s.name = "sysll"
  s.version = "1.2.0"
  s.summary = "Build your code for multiple platforms easily with the sysll gem"
  s.description = "Build your code for multiple platforms easily with the sysll gem"
  s.authors = ["mvghasty"]
  s.email = "fasmagoric.dev@gmail.com"
  s.files = ["lib/sysll.rb", "lib/sysverify.rb", "lib/cmd.rb", "locales/en.yml", "locales/pt.yml"]
  s.homepage = "https://github.com/mvghasty/SYSll"
  s.metadata = {
    "homepage_uri" => "https://github.com/mvghasty/SYSll",
    "source_code_uri" => "https://github.com/mvghasty/SYSll",
    "bug_tracker_uri" => "https://github.com/mvghasty/SYSll/issues"
  }
  s.license = "MIT"
  
  # Dependencies
  s.add_dependency "i18n", "~> 1.12"
end
