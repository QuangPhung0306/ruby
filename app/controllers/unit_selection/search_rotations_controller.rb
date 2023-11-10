class UnitSelection::SearchRotationsController < ApplicationController
  def create
    search_params = JSON.parse(params[:unit_selection_search])
    @unit_selection_calculation = if search_params["unit_selection_input_id"].present?
      UnitSelectionInput.find_by_id(search_params["unit_selection_input_id"]).unit_selection_object
    else 
      UnitSelection::UnitSelectionResult.new current_user, :unit_selection
    end
    begin
      @unit_selection_calculation.change_values search_params["history_change"].to_s.split("\n")
      %w(textbox1 textbox2 textbox3 label6).each do |field|
        @unit_selection_calculation.instance_variable_set("@gg_#{field}", search_params["search_data"][field])
      end
      @unit_selection_calculation.button4_click
    rescue StandardError => exception
      @error_message = exception.message
    end
    @search_results = @unit_selection_calculation.instance_variable_get(:@saved_search_results)
    @form_element_values = @unit_selection_calculation.get_form_element_values
  end
end
