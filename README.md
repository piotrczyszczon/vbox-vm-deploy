# Overview

Scripts designed to deploy useful tools on local VM (eg. virtual box based)

To create local VM, `vbox-vm-setup` project can be used, see: https://github.com/piotrczyszczon/vbox-vm-setup

# Run

Tu run ansible scripts it's required to provide inventory settings and environment configuration.

## Requirements

Ansible binaries are required to run deployment scripts. To setup Ansible environment on Windows box cygwin can be used.

To install cygwin, see following manual: https://www.cygwin.com/install.html

**Important:** Select ansible binaries during installation, as shown below:
![image](https://user-images.githubusercontent.com/62462151/200087868-61c9829d-f0ba-4915-9be2-a46b63a14de0.png)


## Configuration
### Static Inventory

Put your VM addresses into `inventory/static_inventory.yml` file, eg:
```yaml
virtualmachines:
  hosts:
    vm01:
      ansible_host: 127.0.0.1
  vars:
    ansible_user: user
    ansible_password: password
```

### Environment configuration

Create new or re-use existing `environments/xxx` configuration. By creating new file that follows pattern:
`environments/<environment_name>/<instance_type>/main.yml`

eg.: `environments/local/php/main.yml`

and provide required parameters

## Execution

There are dedicated scripts for creating particular instance types:

### PHP

Script name: `php.sh`
Parameters: 
```bash
  -e <environment> - environment for which scripts is going to be executed - see: environments/ dir, eg: local
  -i <instance> - instance for which scripts is going to be executed - see: environments/<environment>/ dir, eg: php
```