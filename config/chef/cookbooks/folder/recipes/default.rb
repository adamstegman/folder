# coding UTF-8
#
# Cookbook Name:: folder
# Recipe:: default
#

user node['folder']['user'] do
  action :create
end

group node['folder']['group'] do
  action  :create
  members node['folder']['user']
end

application 'folder' do
  action            :deploy
  group             node['folder']['group']
  migrate           node['folder']['migrate']
  migration_command 'bundle exec rake db:create db:migrate db:seed'
  owner             node['folder']['user']
  packages          %w(git postgresql-devel postgresql-libs)
  path              node['folder']['path']
  repository        node['folder']['repository']
  revision          node['folder']['revision']
  scm_provider      Chef::Provider::Git

  rails do
    gems              ['bundler']
    precompile_assets true
    database_options = node['folder']['database']
    database do
      adapter  database_options['adapter']
      host     database_options['host']
      database database_options['name']
      encoding database_options['encoding']
      username database_options['username']
      password database_options['password']
    end
  end

  passenger_apache2 do
    webapp_template 'web_app.conf.erb'
  end
end
