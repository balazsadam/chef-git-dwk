resource_name :gitdeploy

default_action :default
property :url, String, name_property: true
property :path, String
property :branch, String
property :vault_name, String
property :vault_item, String

action :default do
  privkey = chef_vault_item(vault_name, vault_item)

  file 'private_key' do
    path "#{Chef::Config[:file_cache_path]}/.git_dwk_rsa"
    owner 'root'
    group 'root'
    mode 00400
    action :create
    content privkey['private_key']
  end

  file 'git_wrapper' do
    path "#{Chef::Config[:file_cache_path]}/git_wrapper.sh"
    owner 'root'
    group 'root'
    mode 00700
    action :create
    content "#!/bin/sh\nexec /usr/bin/ssh -o 'StrictHostKeyChecking=no' -i #{Chef::Config[:file_cache_path]}/.git_dwk_rsa \"$@\""
  end

  git path do
    repository url
    reference branch
    action :sync
    ssh_wrapper "#{Chef::Config[:file_cache_path]}/git_wrapper.sh"
  end
end
