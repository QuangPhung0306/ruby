class ManualDocumentController < ApplicationController
  def show
    @file_name = case params[:model]
    when "room_calculation"
      "manual_of_room_calculation.pdf"
    when "air_mixture"
      "manual_of_airmixture_and_capacity.pdf"
    when "unit_selection"
      "manual_of_unit_selection.pdf"
    else
      "manual_of_room_calculation.pdf"
    end
  end
end
