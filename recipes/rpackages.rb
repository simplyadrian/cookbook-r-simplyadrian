#
# Cookbook Name:: r-nativex
# Recipe:: rpackages 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'r'

installed_r_packages = []
ruby_block "cache list of installed r packages" do
  block do
    require "rinruby"
    R.echo(enable=false)
    R.eval "packages <- installed.packages()[,1]"
    installed_r_packages = R.pull "packages"
  end
  action :run
end

log "installed r packages" do
  level :debug
  message lazy {"Installed R packages: #{installed_r_packages}"}
end

node['r_nativex']['packages'].each do |pkg|
  r_package pkg do
    action :install
    not_if { installed_r_packages.include?(pkg) }
  end
end
