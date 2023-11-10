lock "~> 3.11.0"

set :application, "d-support"

ask :gitlab_user_name, nil
ask :gitlab_password, nil
set :repo_url, "http://#{fetch(:gitlab_user_name)}:#{fetch(:gitlab_password)}@gitlab.ominext.co/d-support/2.source.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/var/rails/d-support"

append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :rvm_ruby_version, "2.6.3"
set :unicorn_pid, ->{"#{shared_path}/tmp/pids/unicorn.pid"}
set :unicorn_config_path, "config/unicorn.rb"
set :unicorn_rack_env, "deployment"

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "unicorn:restart"
    end
  end

  after :publishing, :restart
end
