class UnitSelection::ConvertRoomCalculationResultsController < ApplicationController
  def create
    @result = {}
    r003_result_data = JSON.parse params[:room_calculation_result]
    if r003_result_data["calculation_mode"] == "si"
      @result[:capacity_at_starting_climate] = (r003_result_data["capacity_at_starting_climate"].to_f / 2.204623).round(2).to_s
      @result[:capacity_at_final_climate] = (r003_result_data["capacity_at_final_climate"].to_f / 2.204623).round(2).to_s
      @result[:tp2] = ((r003_result_data["tp2"].to_f - 32) / 1.8).round(1).to_s
      @result[:xp2] = (r003_result_data["xp2"].to_f / 7).round(3).to_s
      @result[:b113] = (r003_result_data["b113"].to_f).round(3).to_s
      @result[:mr] = (r003_result_data["mr"].to_f / 2.204623).round(2).to_s
      @result[:starting_capacity] = (r003_result_data["starting_capacity"].to_f / 2.204623).round(2).to_s
    else
      @result[:capacity_at_starting_climate] = (r003_result_data["capacity_at_starting_climate"].to_f * 2.204623).round(2).to_s
      @result[:capacity_at_final_climate] = (r003_result_data["capacity_at_final_climate"].to_f * 2.204623).round(2).to_s
      @result[:tp2] = (r003_result_data["tp2"].to_f * 1.8 + 32).round(1).to_s
      @result[:xp2] = (r003_result_data["xp2"].to_f * 7).round(3).to_s
      @result[:b113] = (r003_result_data["b113"].to_f * 7).round(3).to_s
      @result[:mr] = (r003_result_data["mr"].to_f * 2.204623).round(2).to_s
      @result[:starting_capacity] = (r003_result_data["starting_capacity"].to_f * 2.204623).round(2).to_s
    end
  end
end
