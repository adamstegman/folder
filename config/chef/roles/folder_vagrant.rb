# coding: UTF-8

name 'folder_vagrant'
description 'Installs the folder application and performs its configuration for Vagrant.'

run_list 'recipe[postgresql::server]',
         'recipe[folder]'

default_attributes({
  'folder' => {
    'database' => {
      'username' => 'postgres',
      'password' => 'folder'
    },
    'migrate' => true
  },
  'postgresql' => {
    'password' => {
      'postgres' => 'md531dc06fa06c22977d4164c2333fe4dce' # folder
    }
  }
})
