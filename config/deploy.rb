set :user do
  Capistrano::CLI.ui.ask "Give me Megiteam username: "
end
set :application, 'postcard_album'
set :repository,  'git://github.com/kbl/postcard_album.git'
set :deploy_to, "/home/#{user}/www/cap_postcard_album/"
set :use_sudo, false

set :scm, :git

role :app, "#{user}.megiteam.pl"
role :db,  "sql.#{user}.megiteam.pl", :no_release => true, :primary => true

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
