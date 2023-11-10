class RoomCalculation::SaveChart
  def initialize params, result
    @params = params
    @result = result
  end

  def execute
    result.chart_datas.destroy_all
    chart_datas = []
    start_moisture = (0.2*(0.1+params[:total_load_from_ventilation].to_f/params[:total_moisture_load].to_f*2)*params[:total_moisture_load].to_f/params[:start_capacity].to_f)
    start_moisture = 0.0 if start_moisture.nan?
    elapsed_time = 0
    moisture_content = (params[:door_to_outdoor_air] == "1" ? params[:odc_moisture_content].to_f : params[:src_moisture_content]).to_f
    start_corresponding = (params[:door_to_outdoor_air] == "1" ? params[:odc_moisture_content].to_f : params[:src_moisture_content]).to_f
    (0..40).each do |i|
      chart_data = ChartData.new room_calculation_result: result, elapsed_time: elapsed_time, moisture_content: moisture_content
      chart_datas.push chart_data
      elapsed_time = elapsed_time + start_moisture
      moisture_content = moisture_content_calculation(moisture_content, start_corresponding, start_moisture) rescue 0.0
    end
    ChartData.import chart_datas
  end

  private
  attr_reader :params, :result

  def moisture_content_calculation moisture_content, start_corresponding, start_moisture
    [(moisture_content-(params[:final_capacity].to_f+(params[:start_capacity].to_f-params[:final_capacity].to_f)*(moisture_content-params[:drc_moisture_content].to_f)/
      (start_corresponding.to_f-params[:drc_moisture_content].to_f)-1.2/1000*(params[:total_ventilation_from_outdoor].to_f*
      (params[:odc_moisture_content].to_f-moisture_content)+params[:air_direct_from_pre_cooling].to_f*
      (params[:corresponding_to].to_f-moisture_content)+params[:air_direct_from_ambient].to_f*
      (params[:odc_moisture_content].to_f-moisture_content))-params[:total_load_from_people].to_f-params[:total_load_from_water_surface].to_f-params[:total_load_from_product_drying].to_f-params[:total_load_from_other_sources].to_f)*
      start_moisture*1000/params[:room_volume].to_f/1.2), params[:drc_moisture_content].to_f].max
  end
end
