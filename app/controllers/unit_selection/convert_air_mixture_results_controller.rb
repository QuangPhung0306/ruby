class UnitSelection::ConvertAirMixtureResultsController < ApplicationController
  def create
    result_params = JSON.parse params[:results]
    return if (result_params["result_ids"].blank? && result_params["air_mixture_ids"].blank?) || result_params["calculation_mode"].blank?
    if result_params["result_ids"].present? && result_params["calculation_mode"] == "ip"
      @results = UnitSelectionResult.by_ids(result_params["result_ids"])
      @unit_selection_results = @results.map(&:convert_result_to_ip)
      @is_ip_mode = true
    elsif result_params["air_mixture_ids"].present?
      @results_checked = result_params["results_checked"]
      @results = UnitSelectionResult.by_air_mixture_ids(result_params["air_mixture_ids"])
      if result_params["calculation_mode"] == "ip"
        @unit_selection_results = @results.map(&:convert_result_to_ip)
        @is_ip_mode = true
      else
        @unit_selection_results = @results
      end
    end
  end
end
