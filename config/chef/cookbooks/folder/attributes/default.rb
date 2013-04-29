# coding: UTF-8
#
# Cookbook Name:: folder
# Attributes:: default
#

default['folder']['group']      = 'folder'
default['folder']['path']       = '/opt/folder'
default['folder']['port']       = '80'
default['folder']['repository'] = 'https://github.com/adamstegman/folder.git'
default['folder']['revision']   = 'master'
default['folder']['user']       = 'folder'

default['folder']['database']['adapter']  = 'postgresql'
default['folder']['database']['encoding'] = 'utf8'
default['folder']['database']['host']     = 'localhost'
default['folder']['database']['name']     = 'folder'
default['folder']['database']['password'] = ''
default['folder']['database']['username'] = ''
