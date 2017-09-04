name 'git_dwk'
maintainer 'Adam Balazs'
maintainer_email 'balazsasd@gmail.com'
license 'GNU GENERAL PUBLIC LICENSE'
description 'Git deploy with key'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/balazsadam/chef-git-dwk'
issues_url 'https://github.com/balazsadam/chef-git-dwk/issues'

depends 'git'
depends 'chef-vault'
