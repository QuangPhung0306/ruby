require "password_generator"

namespace :user_admin do
  desc "import master data"
  task create: :environment do
    abort "You need to config enviroment variable ADMIN_EMAIL" if ENV["ADMIN_EMAIL"].nil?
    password = PasswordGenerator.generate
    u = User.new email: ENV["ADMIN_EMAIL"],
      password: password,
      password_confirmation: password,
      role: :admin
    u.save
    puts "Password of Admin account is: #{password}"
  end
end
