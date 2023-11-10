class PreviewAndPrint::UnitSelectionsController < ApplicationController
  before_action :check_unit_selection_permission
  before_action :set_cache_headers, only: :show

  def show
    unit_selection_result = UnitSelectionResult.find_by id: params[:result_id]
    @unit_selection_calculation = unit_selection_result.unit_selection_input.unit_selection_object
    change_calculation_mode
    
    @project = unit_selection_result.project || Project.new(name: params[:project_name], date_of_project: params[:date_of_project])
    @unit = M::Unit.unit_selection.send("#{current_user.area}").find_by name: params[:unit_name]
    @rotation_rate = unit_selection_result&.rotation
    category_key_name = @unit.m_category_name if @unit

    if category_key_name == "Recusorb 2"
      @type = "recusorb2"
    elsif category_key_name == "Recusorb 1"
      @type = Settings.recusorb_1_mix_units.include?(@unit.name) ? "recusorb1_mix" : "recusorb1"
    elsif category_key_name == "Consorb"
      @type = Settings.consorb_mix_units.include?(@unit.name) ? "consorb_mix" : "consorb_1_3"
    end
  end

  private
  def check_unit_selection_permission
    return if current_user.admin? || current_user.can_access_unit_selection?
    flash[:danger] = t "not_access_permission"
    redirect_to root_path
  end

  def change_calculation_mode
    if params[:calculation_mode] == "ip"
      unless @unit_selection_calculation.instance_variable_get :@radiobutton6
        @unit_selection_calculation.instance_variable_set :@radiobutton6, true
        @unit_selection_calculation.instance_variable_set :@radiobutton5, false
        @unit_selection_calculation.dataGridView1_RowHeaderMouseClick
      end
    else
      unless @unit_selection_calculation.instance_variable_get :@radiobutton5
        @unit_selection_calculation.instance_variable_set :@radiobutton5, true
        @unit_selection_calculation.instance_variable_set :@radiobutton6, false
        @unit_selection_calculation.dataGridView1_RowHeaderMouseClick
      end
    end
  end
end
