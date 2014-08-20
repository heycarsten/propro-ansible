Propro: Provision like a pro
============================

_This is currently a work in progress, so bare with me while I continue working
on it._

Propro will always be biased to my needs for my apps and servers. It's not
intended to be a magical unicorn for every use-case, I deploy Ruby apps to
Ubuntu 12.04 and 14.04 x64 on Linode. I use Postgres, Redis, and Nginx.

Feel free to use it as an Ansible grab-bag or starting-point if your needs
differ. Also check out [Ansible Galaxy](https://galaxy.ansible.com/) for magic
unicorns, there are some mighty robust/battle-hardened roles on there!

## Vagrant Dev VM

1. Copy the Vagrantfile.example and change the private IP and vm name to your
   liking
2. Copy this repo into the `.ansible` (or whatever works for you) directory of
   your Vagrant project, or add it as a submodule.
3. Run `vagrant up` the system should build itself
4. Have a beer or wine or spirit or soda or juice or water to celebrate

## Real World VPS

_Coming soon!_
