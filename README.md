packer-trusty64
===============

  > My packer templates.

---

<!-- MarkdownTOC -->

- [Local testing](#local-testing)

<!-- /MarkdownTOC -->

---


## Local testing

Requirements:
  [packer](https://packer.io/),
  [vagrant](https://www.vagrantup.com/),
  [VirtualBox](https://www.virtualbox.org/)

You can place a respective distribution image within `iso/`.

``` sh
# inpect template properties
packer inspect <template>

# validate template
packer validate <template>

# build template
packer build [-force] [-debug] <template>

# test vagrant box
vagrant box add <boxname> <boxfile>
vagrant init <boxname>
vagrant up

# remove/cleanup vagrant test
vagrant halt
vagrant destroy
vagrant box remove <boxname>
rm -rf .vagrant Vagrantfile

# remove built and temporary files
rm -rf build output-* packer_cache
```
