class ChangeStatusController < ApplicationController
  before_action :check_admin_permission

  def update
    @models = M::Model.all
    user = User.find_by id: params[:id]
    @result = user.update is_active: !user.is_active
    if @result
      flash.now[:success] = t ".update_successful"
      @search = User.normal.ransack params[:q]
      @users = @search.result.order_by_agency_name.page(params[:page])
        .per Settings.paginate.user_per_page
    else
      flash.now[:danger] = t ".update_failed"
    end
  end
end
