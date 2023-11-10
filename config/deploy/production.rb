set :stage, :production
set :rails_env, :production
set :deploy_hostname, :production
server "195.178.183.152", user: "deploy", roles: %w{web app db}
