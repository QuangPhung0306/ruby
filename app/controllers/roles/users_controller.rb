class Roles::UsersController < ApplicationController
  before_action :load_models, :load_search, :check_admin_permission

  def update
    @is_success = begin
      data_update = []
      params[:user].each do |key, value|
        data_update.push [key, {m_model_ids: value[:m_model_ids], area: value[:area].to_i}]  
      end 
      update_users data_update.to_h
      flash.now[:success] = t ".update_role_success"
      true
    rescue
      flash.now[:danger] = t ".update_role_failed"
      false
    end
  end

  private
  def load_models
    @models = M::Model.all
  end

  def load_search
    @search = User.ransack params[:q]
    @users = @search.result.includes(:m_models).order_by_agency_name.page(params[:page])
      .per Settings.paginate.user_per_page
  end

  def update_users users_hash
    ActiveRecord::Base.transaction do
      User.update users_hash.keys, users_hash.values
    end
  end
end
