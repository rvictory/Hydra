#!/usr/bin/env ruby
# hydra_server.rb - Sets up the Hydra Server component and creates client configurations
require 'pathname'
require 'fileutils'
include FileUtils

# Ask a question and retrieve an answer
def ask (question)
  print question
  gets.chomp
end

# Exit, printing why
def stop (reason)
  puts "[!] Not continuing: #{reason}"
  puts "[!] Exiting"
  exit 0
end

# Installs a package depending on which Linux distro we are on
def install_software (package)
  architecture = 'ubuntu'
  if architecture == 'ubuntu'
    puts `apt-get install -y #{package}`
  elsif architecture == 'redhat'
    puts `yum install #{package}`
  else
    stop "Unsupported Architecture: #{architecture}"
  end
end

# Check if we are root
unless Process.uid == 0
   stop "Must be run as root"
end

conf_dir = Pathname.new('/etc/hydra')

# Make sure the user is ok with continuing
puts "[-] hydra_server.rb - Sets up the Hydra Server component and creates the client configuration"
puts "[-] This script will create the #{conf_dir} directory and place configuration there"
continue = ask "[?] Continue? y/n [y]: "

unless continue.empty? || continue =~ /^y$/i
  stop "User answered no"
end

# Look for existing configuration
if Dir.exists? (conf_dir)
  puts "[-] Configuration directory exists"
else
  # Create the /etc/hydra directory if it doesn't exist
  puts "[-] Creating configuration directory (#{conf_dir})"
  mkdir conf_dir
end

# Check for OpenVPN - install if need be
puts "[-] Checking for OpenVPN"

# Check for Easy RSA (should we do this?)

# Generate the Certificates

# Ask for configuration information

# Create the OpenVPN configuration file

# Start OpenVPN

# Make the tap0 interface promiscuous

# Generate Client Configuration Scripts/OVPN files

# Print next steps

# Done?


