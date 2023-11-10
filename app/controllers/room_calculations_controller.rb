class RoomCalculationsController < ApplicationController
  before_action :check_room_calculation_permission
  before_action :set_cache_headers, only: :show

  def show
    @categories = M::Category.r003_category
    @units = M::Unit.room_calculation.r003_unit.send "#{current_user.area}"
    @project = current_user.projects.room_calculation.find_by name: params[:project_name_hidden]
    @current_project = current_user.projects.room_calculation.pluck :name
    @corrections = M::CorrectionFactor.all
  end

  def create
    ActiveRecord::Base.transaction do
      project = current_user.projects.room_calculation.find_or_initialize_by name: params[:project_name]
      project.assign_attributes date_of_project: params[:date_of_project]
      project.save!
      room_calculation_input = RoomCalculationInput.find_or_initialize_by project: project
      room_calculation_input.assign_attributes room_calculation_input_params
      room_calculation_input.save!
      result = RoomCalculation::SaveResult.new(params, project, room_calculation_input).execute
      RoomCalculation::SaveChart.new(params, result).execute
      @export_project_csv_url = export_csv_projects_path(project_id: project.id)
      flash.now[:success] = t ".create_successful"
    end
  rescue
    flash.now[:danger] = t ".infinity_error"
  end

  private
  def room_calculation_input_params
    RoomCalculationInput.column_names.each do |attribute|
      params[attribute.to_sym] = nil if params[attribute.to_sym] == "NaN"
    end
    params.permit RoomCalculationInput::ROOM_CALCULATION_INPUT_ATTR
  end

  def check_room_calculation_permission
    return if current_user.admin? || current_user.can_access_room_calculation?
    flash[:danger] = t "not_access_permission"
    redirect_to root_path
  end
end
