require "password_generator"

class PasswordResetController < ApplicationController
  before_action :check_admin_permission

  def update
    user = User.find_by id: params[:id]
    generate_password = PasswordGenerator.generate
    if user.update password: generate_password
      UserMailer.send_changed_password(CGI.escapeHTML(generate_password),
        user.email, user.agency_name,
        current_user.id, user.id, ENV["WEB_ADDRESS"]).deliver_later
      flash.now[:success] = t ".reset_success"
    else
      flash.now[:danger] = t ".reset_failed"
    end
  end
end
