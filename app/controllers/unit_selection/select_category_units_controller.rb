class UnitSelection::SelectCategoryUnitsController < ApplicationController
  def show
    category_key_name = params[:category]
    unit = params[:unit]
    category = M::Category.find_by key_name: category_key_name
    @units = category.m_units.unit_selection.try "#{current_user.area}" if category

    if category_key_name == "recusorb_2"
      @type = "recusorb_2"
    elsif category_key_name == "recusorb_1"
      @type = Settings.recusorb_1_mix_units.include?(unit) ? "mix_recusorb_1" : "recusorb_1"
    elsif category_key_name == "consorb"
      @type = Settings.consorb_mix_units.include?(unit) ? "mix_consorb" : "consorb"
    end

    set_visible_tabs

    @unit_selection_calculation = UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    @unit_selection_calculation.change_category_or_unit category.name, unit
    @form_element_values = @unit_selection_calculation.get_form_element_values
  end

  private
  def set_visible_tabs
    category_key_name = params[:category]
    unit = params[:unit]
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
