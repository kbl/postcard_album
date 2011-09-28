set :user do
  Capistrano::CLI.ui.ask "Give me Megiteam username: "
end
set :remote_home, "/home/#{user}/www"
set :db_config_location, "#{remote_home}/config/database.yml"
set :environment_settings_location, "#{remote_home}/config/.environment"

set :application, 'postcard_album'
set :repository,  'git://github.com/kbl/postcard_album.git'
set :deploy_to, "#{remote_home}/cap_postcard_album/"
set :use_sudo, false

set :scm, :git

role :app, "#{user}.megiteam.pl"
role :web, "#{user}.megiteam.pl"
role :db,  "sql.#{user}.megiteam.pl", primary: true

namespace :deploy do

  desc 'overriden restart special for megiteam'
  task :restart do
    run 'restart-app widokowki_ror3'
  end

  desc 'copying essential files for production env'
  task :update_configuration, except: {no_relase: true} do
    run <<-CMD
      cp -vf #{db_config_location} #{release_path}/config/ &&
      cp -vf #{environment_settings_location} #{release_path}/
    CMD
  end

  after 'deploy:update', 'deploy:update_configuration'
end

