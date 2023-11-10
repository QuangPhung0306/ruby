class AirMixtureChangeValuesController < ApplicationController
  def show
    category_name = M::Category.find_by(id: params[:category_id]).try :name
    unit_name = M::Unit.find_by(id: params[:unit_id]).try :name
    change_value_array = params[:heater_select_value] == "9" ? ["radiobutton9:true"] : ["radiobutton8:true"]
    unit_selection_result = UnitSelection::UnitSelectionResult.new current_user, :air_mixture
    unit_selection_result.change_category_or_unit category_name, unit_name
    unit_selection_result.change_values change_value_array
    if params[:category_or_unit_change] == "2"
      change_value_array.push "textbox50:#{params[:textbox50]}"
      unit_selection_result.change_values change_value_array
    end

    @hp = unit_selection_result.get_field_value_by_mode "textbox50", "si"
    @tr1 = unit_selection_result.get_field_value_by_mode "textbox2", "si"
  end
end
