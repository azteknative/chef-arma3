#
# Cookbook Name:: arma3
# Recipe:: default
#
# Copyright (C) 2015 AzTek Native Ltd.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "steamcmd"

steamcmd_app "arma3_ds" do
  action :install
  app_id 233780
  steam_user node['arma3']['steam_username']
  steam_password node['arma3']['steam_password']
  base_path node['arma3']['install_base']
end

template "#{node['arma3']['install_base']}/arma3_ds/server.cfg" do
  source "server.cfg.erb"
  owner node['steamcmd']['user']
  group node['steamcmd']['group']
  mode "0644"
end

# Create additional configuration dirs required
[ ".local",
   ".local/share",
   ".local/share/Arma 3",
   ".local/share/Arma 3 - Other Profiles" ].each do |dir|

  directory "/home/#{node['steamcmd']['user']}/#{dir}" do
    action :create
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode "0755"
  end

end

# Add startup script
template "/etc/init.d/arma3server" do
  source "arma3server.sh.erb"
  owner "root"
  group "root"
  mode "0755"
end

# Start service
service "arma3server" do
  action :start
end

