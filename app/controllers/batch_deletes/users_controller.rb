class BatchDeletes::UsersController < ApplicationController
  def destroy
    users_to_delete = User.by_ids params[:users_id_selected].split(",")
    if users_to_delete.delete_all > 0
      flash[:success] = t ".delete_users_successfully"
    else
      flash[:danger] = t ".delete_users_failed"
    end
  
    redirect_to users_path
  end
end
