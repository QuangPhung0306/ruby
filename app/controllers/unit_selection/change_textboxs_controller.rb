class UnitSelection::ChangeTextboxsController < ApplicationController
  def create
    @unit_selection_calculation = UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    @unit_selection_calculation.change_category_or_unit params[:category], params[:unit]
    history_change
  end

  private
  def history_change
    if params[:history_change].blank?
      params[:history_change].split("\n").each do |history|
        textbox_name, value = history.split("-")
        @unit_selection_calculation.change_textbox textbox_name, value
      end
    else
      @unit_selection_calculation.change_textbox params[:textbox_name], params[:value]
    end
  end
end
