cfg_file = %w{bash_env bash_aliases tmux.conf vimrc}
home_dir = ENV['HOME']

cp_cfg = ->(name) { cp("cfg_dir/#{name}", "#{home_dir}/.#{name}.bk") }
rm_cfg = ->(name) { rm("#{home_dir}/.#{name}.bk") }

desc "cp cfg_file to ~/.cfg_file"
task :cp_cfg_file do
  cfg_file.each { |f| cp_cfg.call f }
end

desc "rm ~/.cfg_file"
task :rm_cfg_file do
  cfg_file.each { |f| rm_cfg.call f }
end

desc "update system"
task :update_system do
  system("sudo apt-get update") && system("sudo apt-get upgrade") if `uname -a` =~ /ubuntu/i
end

apt_source_list = <<END
deb http://mirrors.#{source_host}.com/ubuntu/  main restricted universe multiverse
deb http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-security main restricted universe multiverse
deb http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-updates main restricted universe multiverse
deb http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-proposed main restricted universe multiverse
deb http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-backports main restricted universe multiverse
deb-src http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename} main restricted universe multiverse
deb-src http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-security main restricted universe multiverse
deb-src http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-updates main restricted universe multiverse
deb-src http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-proposed main restricted universe multiverse
deb-src http://mirrors.#{source_host}.com/ubuntu/ #{ubuntu_codename}-backports main restricted universe multiverse
END

source_hosts = %w{163 aliyun}
ubuntu_codenames = { "12.04" => "precise",
                     "12.10" => "quantal",
                     "14.04" => "trusty", 
                     "14.10" => "utopic", 
                     "15.04" => "vivid"}

desc "change software sources"
task :change_software_sources do
  puts "select sources: #{source_host}"
  source_host = gets
  exit(1) unless source_hosts.include? source_host
  puts "select version: #{ubuntu_codenames.keys}"
  ubuntu_codename = gets
  exit(2) unless ubuntu_codenames.keys.include? ubuntu_codename
  puts "You will change Ubuntu #{ubuntu_codename} #{ubuntu_codenames[ubuntu_codename]} with mirrors.#{source_host}.com"
  mv("/etc/apt/sources.list", "/etc/apt/sources.list.bk")
  File.write("/etc/apt/sources.list",apt_source_list)
end
