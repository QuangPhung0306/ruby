class RoomCalculationResultsController < ApplicationController
  before_action :set_cache_headers, only: :show

  def show
  end

  def create
    begin
      @result = UnitSelection::ChooseCorrectUnit.new(current_user,
        room_calculation_params).perform
    rescue StandardError => exception
      response.set_header("calculation_result", false)
      @error_message = exception.message.present? ? exception.message : t(".unit_selection_calculation_error")
    end
  end

  private
  def room_calculation_params
    JSON.parse params.require(:room_calculation_result)
  end
end
