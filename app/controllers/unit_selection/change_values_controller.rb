class UnitSelection::ChangeValuesController < ApplicationController
  def create
    @unit_selection_calculation = if params[:unit_selection_input_id].present?
      (input = UnitSelectionInput.find_by_id(params[:unit_selection_input_id])).unit_selection_object
    else
      UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    end
    if params[:reload_result] == "1"
      @rotation_rate = input&.unit_selection_result&.rotation
    end
    @unit_selection_calculation.change_values params[:history_change].to_s.split("\n"), params[:input_ids], params[:radiobutton5]
    @form_element_values = @unit_selection_calculation.get_form_element_values
    category_name = @form_element_values["combobox2"]
    @unit_name = @form_element_values["combobox8"]

    category = M::Category.find_by name: category_name
    @units = category.m_units.unit_selection.try "#{current_user.area}" if category

    if category_name == "Recusorb 2"
      @type = "recusorb_2"
    elsif category_name == "Recusorb 1"
      @type = Settings.recusorb_1_mix_units.include?(@unit_name) ? "mix_recusorb_1" : "recusorb_1"
    elsif category_name == "Consorb"
      @type = Settings.consorb_mix_units.include?(@unit_name) ? "mix_consorb" : "consorb"
    end

    set_visible_tabs category_name, @unit_name
    if params[:input_ids].present?
      @unit_selection_results = @unit_selection_calculation.get_all_results
    end
  end

  private
  def set_visible_tabs category_name, unit
    category_key_name = M::Category.find_by_name(category_name).try(:key_name)
    @visible_tabs = if unit.blank?
      Settings.unit_selection.tab_input_visible.category.send(category_key_name)
    elsif category_key_name == "recusorb_1"
      Settings.unit_selection.tab_input_visible.unit.recusorb_1.send(Settings.recusorb_1_mix_units.include?(unit) ? "common" : "other")
    elsif category_key_name == "recusorb_2"
      Settings.unit_selection.tab_input_visible.category.recusorb_2
    elsif category_key_name == "consorb"
      Settings.unit_selection.tab_input_visible.unit.consorb.send(Settings.consorb_mix_units.include?(unit) ? "common" : "other")
    end
  end
end
