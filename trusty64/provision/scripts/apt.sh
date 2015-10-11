#!/usr/bin/env bash

###
# update and install packages via apt
# ===================================
###

APT_GET_QUIET="apt-get -y -qq"

echo_c "Add custom sources..."

$APT_GET_QUIET install software-properties-common
add-apt-repository -y ppa:git-core/ppa

echo_c "Updating apt sources..."

$APT_GET_QUIET update

echo_c "Upgrading packages..."

$APT_GET_QUIET -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

echo_c "Install Packages..."

$APT_GET_QUIET install curl vim mc htop iotop iftop tree nfs-common git zsh
