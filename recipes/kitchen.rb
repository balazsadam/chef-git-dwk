#
# Cookbook:: git_dwk
# Recipe:: default
#
# Copyright:: 2017, Adam Balazs, All Rights Reserved.

include_recipe 'git_dwk::default'

directory '/usr/src/git/' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

gitdeploy node['git_dwk']['url'] do
  path node['git_dwk']['path']
  vault_name node['git_dwk']['vault_name']
  vault_item node['git_dwk']['vault_item']
  branch node['git_dwk']['vault_item']
  action :default
end
