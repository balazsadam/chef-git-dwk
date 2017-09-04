# git_dwk

Git deploy with key. You can use this cookbook to deploying from your Own server via ssh.

Fist step:
==========

Convert ssh key to json compatible format:

```
cat .ssh/dummy | tr "\n" "#" | sed 's/#/\\n/g'
```

Second step:
============

Create a vault, and upload ssh private key. You can see an example in cookbook.

Third step:
===========

Include my recipe and add this snippet to your recipe:

```
gitdeploy <repository> do
  path <path>
  vault_name <vault_name>
  vault_item <vault_item>
  branch <master>
  action :default
end
```
