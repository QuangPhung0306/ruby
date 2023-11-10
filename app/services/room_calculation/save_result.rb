class RoomCalculation::SaveResult
  def initialize params, project, room_calculation_input
    @params = params
    @project = project
    @room_calculation_input = room_calculation_input
  end

  def execute
    atmospheric_pressure = params[:drc_atmospheric_pressure]

    start_temperature = params[:door_to_outdoor_air] == "1" ? params[:odc_temperature] : params[:src_temperature]
    starting_relative_humidity = params[:door_to_outdoor_air] == "1" ? params[:odc_relative_humidity] : params[:src_relative_humidity]
    start_corresponding = params[:door_to_outdoor_air] == "1" ? params[:odc_moisture_content] : params[:src_moisture_content]

    result = RoomCalculationResult.find_or_initialize_by room_calculation_input: room_calculation_input, project: project
    result.assign_attributes final_temperature: params[:drc_temperature], final_relative_humidity: params[:drc_relative_humidity],
      final_atmospheric_pressure: atmospheric_pressure, final_corresponding_to: params[:drc_moisture_content],
      start_temperature: start_temperature, starting_relative_humidity: starting_relative_humidity, starting_atmospheric_pressure: atmospheric_pressure,
      starting_corresponding_to: start_corresponding, number_of_unit: params[:number_of_units], choosen_unit: M::Unit.room_calculation.find(params[:m_unit_id]).name,
      capacity_at_starting_climate: params[:start_capacity], capacity_at_final_climate: params[:final_capacity],
      result_tp2: params[:result_tp2], result_xp2: params[:result_xp2], result_mr: params[:result_mr]
    result.save!
    result
  end

  private
  attr_reader :params, :project, :room_calculation_input
end
