set :stage, :beta
set :rails_env, :beta
set :deploy_hostname, :beta
server "192.168.100.110", user: "deploy", roles: %w{web app db}
