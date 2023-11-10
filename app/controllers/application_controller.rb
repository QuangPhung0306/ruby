class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def check_admin_permission
    return if current_user.admin?
    flash[:danger] = t "not_access_permission"
    redirect_to root_path
  end

  private
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, 
      max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end

  def after_sign_out_path_for _resource
    new_user_session_path
  end
end
