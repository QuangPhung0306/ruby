class UnitSelectionsController < ApplicationController
  before_action :check_unit_selection_permission
  before_action :set_cache_headers, only: :show

  def show
    @categories = M::Category.all
    @units = @categories.first.m_units.unit_selection.try :send, "#{current_user.area}"
    @unit_selection_calculation = UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    @unit_selection_projects = current_user.projects.unit_selection.pluck(:name).to_json
    if params[:reload_project] == "true"
      @reload_project = current_user.projects.unit_selection.find_by name: params[:project_name]
      return unless @reload_project
      @unit_selection_results = @reload_project.unit_selection_results
      @unit_selection_input = @unit_selection_results.first.unit_selection_input
      @unit_selection_results = get_project_results @unit_selection_results.map(&:unit_selection_input_id)
      @current_unit_selection_input_id = @unit_selection_input.id
      @is_reload_project = true
      master_data @unit_selection_input
    end

    if params[:click_result] == "true"
      @unit_selection_input = UnitSelectionInput.find_by(id: params[:id])
      @current_unit_selection_input_id = @unit_selection_input.id
      master_data @unit_selection_input
    end
  end

  def create
    unit_selection_calculation = if params[:unit_selection_input_id].present?
      UnitSelectionInput.find_by_id(params[:unit_selection_input_id]).unit_selection_object
    else
      UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    end
    begin
      unit_selection_calculation.change_values params[:history_change].split("\n")
      @unit_selection_result = unit_selection_calculation.execute
    rescue StandardError => exception
      @error_message = exception.message
    end
    @form_element_values = unit_selection_calculation.get_form_element_values
  end

  private
  def check_unit_selection_permission
    return if current_user.admin? || current_user.can_access_unit_selection?
    flash[:danger] = t "not_access_permission"
    redirect_to root_path
  end

  def master_data unit_selection_input
    @master_data = {
      m_category_key_name: unit_selection_input.m_category.key_name,
      m_category_name: unit_selection_input.m_category.name,
      m_unit_name: unit_selection_input.m_unit.name
    }
  end

  def get_project_results input_ids
    unit_selection_calculation = UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    @unit_selection_object = @unit_selection_input.unit_selection_object

    if @unit_selection_object.instance_variable_get(:@radiobutton6)
      unit_selection_calculation.instance_variable_set :@radiobutton6, true
      unit_selection_calculation.instance_variable_set :@radiobutton5, false
      unit_selection_calculation.instance_variable_set :@input_ids, input_ids
      unit_selection_calculation.radiobutton6_checkedchanged
    elsif @unit_selection_object.instance_variable_get(:@radiobutton5)
      unit_selection_calculation.instance_variable_set :@radiobutton6, false
      unit_selection_calculation.instance_variable_set :@radiobutton5, true
      unit_selection_calculation.instance_variable_set :@input_ids, input_ids
      unit_selection_calculation.radiobutton5_checkedchanged
    end
    unit_selection_calculation.get_all_results
  end
end
