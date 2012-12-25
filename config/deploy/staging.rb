set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
require "rvm/capistrano"
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
set :rvm_type, :user

before "deploy:setup", "db:configure"
after "deploy:update_code", "db:symlink", "deploy:migrate", "deploy:finalize_update"
#after "deploy:finalize_update", "deploy:update_symlink"

set :rails_env, "staging"

set :application, "IosAppRanking"
set :user, "deploy"
set :group, "deploy"
set :use_sudo, false

set :repository, "git@github.com:elvin-lian/ios_app_ranking.git"
set :branch, "develop"
set :scm, :git
set :scm_username, "elvin-lian"
set :scm_password, ""

set :database_username, "root"
set :production_database, "ios_app_ranking"
set :deploy_to, "/var/www/ios_app_ranking"
set :deploy_via, :remote_cache
set :deploy_env, 'staging'

role :web, "localhost" # Your HTTP server, Apache/etc
role :app, "localhost" # This may be the same as your `Web` server
role :db, "localhost", :primary => true # This is where Rails migrations will run
#role :db, "your slave db-server here"

namespace :deploy do

  desc "Make symlink for uploaded files folder"
  task :update_symlink do
    run "ln -s {shared_path}/public/system {current_path}/public/system"
  end

  task :start do
  end
  task :stop do
  end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

namespace :db do
  desc "Create database yaml in shared path"
  task :configure do
    set :database_password do
      Capistrano::CLI.password_prompt "Database password: "
    end

    db_config = <<-EOF
production:
  adapter: mysql2
  encoding: utf8
  pool: 10
  reconnect: true
  host: localhost
  username: #{database_username}
  password: #{database_password}
  database: #{production_database}
    EOF

    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
end
load 'deploy/assets'