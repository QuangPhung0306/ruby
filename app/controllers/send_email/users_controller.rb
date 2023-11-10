class SendEmail::UsersController < ApplicationController
  before_action :check_admin_permission

  def update
    if params[:content].blank?
      flash.now[:danger] = t ".content_required"
    else
      user_ids = params[:user_ids_to_send_email].split ","
      users = User.includes(:agency).by_ids user_ids
      users.each do |user|
        UserMailer.send_email_to_users(user.agency_name, user.email, params[:content], current_user.id, user.id, ENV["WEB_ADDRESS"]).deliver_later
      end
      flash.now[:success] = t ".send_email_success"
    end
  end
end
