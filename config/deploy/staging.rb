set :stage, :staging
set :rails_env, :staging
set :deploy_hostname, :staging
server "192.168.100.43", user: "deploy", roles: %w{web app db}
