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

## Real World

1. Add your own `inventory` directory, check out the `inventory_example`
   for how this might look.
2. Add and build a VPS in your provider of choice, remember to choose Ubuntu
   12.04, or 14.04 as Propro was only built against those two distributions.
3. Run the `prepare-vps.yml` playbook, this adds the public keys for the GitHub
   users you specified in `admin_authorized_githubbers` variable and disables
   root login and password login.
4. Now you can run the `site.yml` playbook and provision your servers.
