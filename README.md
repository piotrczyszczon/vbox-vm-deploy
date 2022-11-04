# Overview

Scripts designed to deploy useful tools on local VM (eg. virtual box based)

To create local VM, `vbox-vm-setup` project can be used, see: https://github.com/piotrczyszczon/vbox-vm-setup

# Run

In current state - initial version - script can be run with following command

```ansible
ansible-playbook -K -i inventory.yaml playbook.yaml
```