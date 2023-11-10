require "password_generator"

class UsersController < ApplicationController
  before_action :check_admin_permission
  before_action :set_cache_headers, only: :index

  def index
    @all_user_ids = User.pluck :id
    @models = M::Model.all
    @search = User.normal.ransack params[:q]
    @users = @search.result.includes(:m_models).order_by_agency_name.page(params[:page])
      .per Settings.paginate.user_per_page
  end

  def create
    @user = User.new user_params
    password_generate = PasswordGenerator.generate
    @user.password = password_generate
    @user.area = params[:user][:area].to_i
    @user.build_agency agency_params

    @is_success = if @user.save
      UserMailer.send_email_after_register_agency(@user.agency_name, 
        @user.email, CGI.escapeHTML(password_generate),
        current_user.id, @user.id, ENV["WEB_ADDRESS"]).deliver_later
      flash.now[:success] = t ".create_successful"
      true
    else
      flash.now[:danger] = t ".create_failed"
      false
    end
  end

  private
  def user_params
    params.require(:user).permit :email, m_model_ids: []
  end

  def agency_params
    params.require(:user).permit(agency: [:name])[:agency]
  end
end
