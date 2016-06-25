#!/bin/bash

# Update our OS...
yum update -y

# Install dependencies for RVM and Ruby...
#sudo yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel libxml2-devel libyaml-devel libxslt-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel git

# import signing key
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Get and install RVM
curl -L https://get.rvm.io | bash -s stable

# Source rvm.sh so we have access to RVM in this shell
source /etc/profile.d/rvm.sh

# Install Ruby
rvm install ruby-2.2
rvm alias create default ruby-2.2

source /etc/profile.d/rvm.sh

# Update rubygems, and pull down facter and then puppet...
rvm 2.2 do gem update --system
rvm 2.2 do gem install facter --no-ri --no-rdoc
rvm 2.2 do gem install puppet --no-ri --no-rdoc
rvm 2.2 do gem install libshadow --no-ri --no-rdoc

# install r10k
rvm 2.2 do gem install r10k --no-ri --no-rdoc

# Install Ruby 1.8.7
rvm install ruby-1.8.7-head
rvm alias create default ruby-1.8.7-head

# Install puppet and etc
rvm 1.8 do gem install facter --no-ri --no-rdoc
rvm 1.8 do gem install puppet --no-ri --no-rdoc
rvm 1.8 do gem install libshadow --no-ri --no-rdoc

rvm 1.8 do gem install puppet-module --no-ri --no-rdoc

# Create necessary Puppet directories...
mkdir -p /etc/puppet /var/lib /var/log /var/run
