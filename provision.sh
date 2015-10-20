#!/bin/bash -x
vagrant_dir='/vagrant/tmp'
vagrant_pkg='vagrant_1.7.4_x86_64.deb'

function working_dir {
  [ -d $1 ] || mkdir -p $1
  cd $1
}

function download_file {
  [ -s $1 ] || wget --no-verbose $2
}

function dpkg_install {
  dpkg -s $1 || dpkg -i $2
}

function apt_install {
  dpkg -s $1 || apt-get install -y $1
}

function vagrant_plugin_install {
  vagrant plugin list | grep $1 || vagrant plugin install $1
}

#apt-get update
#apt-get install -y collectd collectd-utils

working_dir $vagrant_dir
download_file $vagrant_dir/$vagrant_pkg https://dl.bintray.com/mitchellh/vagrant/$vagrant_pkg
dpkg_install vagrant $vagrant_dir/$vagrant_pkg
apt_install libxslt-dev
apt_install libxml2-dev
apt_install libvirt-dev
apt_install zlib1g-dev
vagrant_plugin_install vagrant-libvirt
