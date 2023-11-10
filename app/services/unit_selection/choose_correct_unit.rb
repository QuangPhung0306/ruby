class UnitSelection::ChooseCorrectUnit
  def initialize user, room_calc_data
    @user = user
    @room_calc_data = room_calc_data["calculation_data"].to_a
    @calculation_mode = room_calc_data["calculation_mode"]
  end

  def perform
    room_calc_data.each do |data|
      current_room_calc_data = data.dup
      current_room_calc_data["unit_name"] = M::Unit.find_by_id(current_room_calc_data["unit_id"]).try(:name)
      room_calc_b113 = current_room_calc_data["b113"]
      current_room_calc_data.delete("b113")
      current_room_calc_data.delete("unit_id")
      current_room_calc_data = current_room_calc_data.symbolize_keys
      current_room_calc_data[:calculation_mode] = calculation_mode
      room_calculation_result_service = UnitSelection::RoomCalculationResult.new user, :room_calculation
      draft_result = room_calculation_result_service.execute(**current_room_calc_data) rescue next
      next unless draft_result[:xp2].to_s.match(Settings.regex.float_number)
      if draft_result[:xp2].to_f.round(2) <= room_calc_b113.to_f
        correct_unit = current_room_calc_data[:unit_name]
        room_calc_b113_convert = calculation_mode == "si" ? room_calc_b113 : room_calc_b113.to_f*7
        @result = draft_result.merge(unit_name: correct_unit, b113: room_calc_b113_convert)
        starting_capacity_calculation_service = UnitSelection::RoomCalculationResult.new user, :room_calculation
        starting_capacity = starting_capacity_calculation_service.calculation_starting_capacity(**current_room_calc_data)
        warning_messages = (room_calculation_result_service.instance_variable_get(:@warning_messages).to_a)
          .concat(starting_capacity_calculation_service.instance_variable_get(:@warning_messages).to_a)
        @result = @result.merge(starting_capacity: starting_capacity, warning_messages: warning_messages)
        break
      end
    end
    return unless @result
    if calculation_mode == "si"
      {si: @result, ip: @result}
    elsif calculation_mode == "ip"
      convert_data = @result.dup
      {si: @result, ip: convert_result_to_ip(convert_data)}
    end
  end

  private
  attr_accessor :user, :room_calc_data, :result, :calculation_mode

  def convert_result_to_si data
    data[:input_dry_air_temperature] = ((data[:input_dry_air_temperature].to_f - 32) / 1.8).round(1).to_s
    data[:input_total_wet_air_flow] = data[:input_total_wet_air_flow] == "0" ? "0" : (data[:input_total_wet_air_flow].to_f * 1.699).to_s
    data[:capacity_at_starting_climate] = (data[:capacity_at_starting_climate].to_f / 2.204623).round(2).to_s
    data[:capacity_at_final_climate] = (data[:capacity_at_final_climate].to_f / 2.204623).round(2).to_s
    data[:tp2] = ((data[:tp2].to_f - 32) / 1.8).round(1).to_s
    data[:xp2] = (data[:xp2].to_f / 7).round(3).to_s
    data[:mr] = (data[:mr].to_f / 2.204623).round(2).to_s
    data[:starting_capacity] = (data[:starting_capacity].to_f / 2.204623).round(2).to_s
    data
  end

  def convert_result_to_ip data
    data[:input_dry_air_temperature] = ((data[:input_dry_air_temperature].to_f * 1.8) + 1.8).round(1).to_s
    data[:input_total_wet_air_flow] = data[:input_total_wet_air_flow] == "0" ? "0" : (data[:input_total_wet_air_flow].to_f / 1.699).to_s
    data[:capacity_at_starting_climate] = (data[:capacity_at_starting_climate].to_f * 2.204623).round(2).to_s
    data[:capacity_at_final_climate] = (data[:capacity_at_final_climate].to_f * 2.204623).round(2).to_s
    data[:tp2] = ((data[:tp2].to_f * 1.8) + 32).round(1).to_s
    data[:xp2] = (data[:xp2].to_f * 7).round(3).to_s
    data[:mr] = (data[:mr].to_f * 2.204623).round(2).to_s
    data[:starting_capacity] = (data[:starting_capacity].to_f * 2.204623).round(2).to_s
    data
  end
end
