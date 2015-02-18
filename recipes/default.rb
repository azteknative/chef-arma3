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
  steam_user node['arma3']['steam_user']
  steam_password node['arma3']['steam_password']
end
