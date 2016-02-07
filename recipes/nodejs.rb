# Cookbook Name:: btc-infrastructure
# Recipe:: nodejs
#
# Author:: Matt Waite
#
# Copyright 2016, Adventure Cycling Association

=begin
#<
Installs Node.js, including npm. Git is also installed, at version
`['git']['version']`
#>
=end

installers = node['installers']['dir']

include_recipe 'git::windows'

node_url = node['nodejs']['url']
node_msi = node['nodejs']['msi']

remote_file "#{installers}/#{node_msi}" do
  source "#{node_url}/#{node_msi}"
  checksum node['nodejs']['checksum']
  action :create
end

# Install Node.js to Program Files and update Path
windows_package 'Node.js' do
  source "#{installers}/#{node_msi}"
  action :install
end

# Need to correct the Chef process for the rest of our run
if !ENV['Path'].match(/nodejs/)
  ENV['Path'] += ';C:\\Program Files\\nodejs\\'
end
