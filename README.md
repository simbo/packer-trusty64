simbo-packer
============

  > My packer templates.

---

Requirements:
  [packer](https://packer.io/),
  [vagrant](https://www.vagrantup.com/),
  [VirtualBox](https://www.virtualbox.org/)

Usage:

``` sh
# inpect template properties
packer inspect <template>

# validate template
packer validate <template>

# build template
packer build [-force] [-debug] <template>

# test vagrant box
vagrant init <boxfile>
vagrant up
```

## Ubuntu *“Trusty Tahr”*

Template: `trusty64.json`

Current version: Ubuntu Server 14.04.3 LTS
