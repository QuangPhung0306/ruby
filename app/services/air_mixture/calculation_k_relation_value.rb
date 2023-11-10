class AirMixture::CalculationKRelationValue
  def initialize air_mixture_input, calculation_result
    @air_mixture_input = air_mixture_input
    @calculation_result = calculation_result
    @k_flow_rate = calculation_result[:k_flow_rate].to_f
    @k_temperature = calculation_result[:b_tp2].to_f
    @k_absolute_humidity = calculation_result[:b_xp2].to_f
    @m_unit_dry_air = calculation_result[:m_unit_dry_air]
  end

  def execute
    {
      k_flow_rate: k_flow_rate,
      k_temperature: k_temperature,
      k_absolute_humidity: k_absolute_humidity,
      s_absolute_humidity: cal_s_absolute_humidity,
      l_temperature: cal_l_temperature,
      l_absolute_humidity: cal_l_absolute_humidity,
      l_cathode_capacity: cal_l_cathode_capacity,
      d_temperature: cal_d_temperature,
      d_absolute_humidity: cal_d_absolute_humidity,
      e_temperature: cal_e_temperature,
      e_absolute_humidity: cal_e_absolute_humidity,
      e_anode_capacity: cal_e_anode_capacity,
      e_cathode_capacity: cal_e_cathode_capacity,
      room_capacity: cal_room_capacity,
      correspondes_to: cal_correspondes_to,
      total_cooling_power: cal_total_cooling_power,
      total_cooling_water_flow: cal_total_cooling_water_flow,
      total_heater_power: cal_total_heater_power,
      total_hot_water_flow: cal_total_hot_water_flow,
      temp_difference_SA_and_RA: cal_temp_difference_SA_and_RA
    }
  end

  private
  attr_reader :air_mixture_input, :calculation_result, :k_flow_rate, :k_temperature,
              :k_absolute_humidity, :m_unit_dry_air

  def cal_e_temperature
    e_temperature_input = format_special_field(air_mixture_input.e_temperature)
    @e_temperature ||= e_temperature_input.nan? ? cal_d_temperature : e_temperature_input
  end

  def cal_d_temperature
    l2 = @l_temperature || cal_l_temperature
    c1 = format_air_mixture_field(air_mixture_input.c_flow_rate)
    h2 = format_air_mixture_field(air_mixture_input.h_temperature)

    d_temperature_input = format_air_mixture_field(air_mixture_input.d_temperature)
    d_temperature_cal = (m_unit_dry_air * l2 + c1 * h2) / (m_unit_dry_air + c1)
    @d_temperature ||= d_temperature_cal
  end

  def cal_l_temperature
    l_temperature_input = format_special_field(air_mixture_input.l_temperature)
    @l_temperature ||= l_temperature_input.nan? ? k_temperature : l_temperature_input
  end

  def cal_d_absolute_humidity
    l3 = @l_absolute_humidity || cal_l_absolute_humidity
    c1 = format_air_mixture_field(air_mixture_input.c_flow_rate)
    h3 = format_air_mixture_field(air_mixture_input.h_absolute_humidity)
    
    @d_absolute_humidity ||= (air_mixture_input.m_unit.dry_air * l3 + c1 * h3) / (air_mixture_input.m_unit.dry_air + c1)
  end

  def cal_room_capacity
    e1 = format_air_mixture_field(air_mixture_input.e_flow_rate)
    e3 = @e_absolute_humidity || cal_e_absolute_humidity
    a3 = format_air_mixture_field(air_mixture_input.a_absolute_humidity)
    @room_capacity = e1 * 1.2 * (a3 - e3) / 1000;
  end

  def cal_correspondes_to
    @room_capacity ||= cal_room_capacity
    @correspondes_to = @room_capacity * 0.683;
  end

  def cal_temp_difference_SA_and_RA
    e1 = format_air_mixture_field(air_mixture_input.e_flow_rate)
    a2 = format_air_mixture_field(air_mixture_input.a_temperature)
    e2 = @e_temperature || cal_e_temperature

    temp_difference_SA_and_RA = e1 * (a2 - e2) / 3000 * 1.01;
  end

  def cal_total_cooling_power
    n_cathode_capacity = format_air_mixture_field(air_mixture_input.n_cathode_capacity)
    g_cathode_capacity = format_air_mixture_field(air_mixture_input.g_cathode_capacity)
    j_cathode_capacity = format_air_mixture_field(air_mixture_input.j_cathode_capacity)
    l_cathode_capacity = @l_cathode_capacity || cal_l_cathode_capacity
    e_anode_capacity = @e_anode_capacity || cal_e_anode_capacity

    @total_cooling_power = n_cathode_capacity + g_cathode_capacity + l_cathode_capacity + e_anode_capacity + j_cathode_capacity
  end

  def cal_total_cooling_water_flow
    q8 = @total_cooling_power || cal_total_cooling_power
    o9 = format_air_mixture_field(air_mixture_input.water_temperature_in)
    p9 = format_air_mixture_field(air_mixture_input.water_temperature_out)

    total_cooling_water_flow = q8 / ((273 + p9) - (273 + o9)) / 4.18
    @total_cooling_water_flow = if total_cooling_water_flow.nan?
      Float::NAN
    else
      [total_cooling_water_flow, 0].max
    end
  end

  def cal_total_heater_power
    e33 = format_air_mixture_field(air_mixture_input.g_anode_capacity)
    p39 = @e_cathode_capacity || cal_e_cathode_capacity
    @total_heater_power = e33 + p39;
  end

  def cal_total_hot_water_flow
    q10 = @total_heater_power || cal_total_heater_power
    o11 = format_air_mixture_field(air_mixture_input.hot_water_in)
    p11 = format_air_mixture_field(air_mixture_input.hot_water_out)

    total_hot_water_flow = q10 / ((273 + o11) - (273 + p11)) / 4.18
    @total_hot_water_flow = if total_hot_water_flow.nan?
      Float::NAN
    else
      [total_hot_water_flow, 0].max
    end
  end

  def cal_e_absolute_humidity
    ac3 = format_air_mixture_field(air_mixture_input.atmospheric_pressure)
    e2 = @e_temperature || cal_e_temperature
    d3 = @d_absolute_humidity || cal_d_absolute_humidity
    @e_absolute_humidity = if 622/(ac3/Math.exp(12.03-4025/(e2+235))/10/100-1) < d3
      622/(ac3/Math.exp(12.03-4025/(e2+235))/10/100-1)
    else
      d3
    end
  end

  def cal_e_anode_capacity
    ac1 = format_air_mixture_field(air_mixture_input.supply_air_sa)
    d2 = @d_temperature || cal_d_temperature
    d3 = @d_absolute_humidity || cal_d_absolute_humidity
    e2 = @e_temperature || cal_e_temperature
    e3 = @e_absolute_humidity || cal_e_absolute_humidity

    e_anode_capacity = ac1*1.2/3600*(d2+d3/1000*(2500+1.86*d2)-(e2+e3/1000*(2500+1.86*e2)))
    @e_anode_capacity = if e_anode_capacity.nan?
      Float::NAN
    else
      [e_anode_capacity, 0].max
    end
  end

  def cal_e_cathode_capacity
    ac1 = format_air_mixture_field(air_mixture_input.supply_air_sa)
    d2 = @d_temperature || cal_d_temperature
    d3 = @d_absolute_humidity || cal_d_absolute_humidity
    e2 = @e_temperature || cal_e_temperature
    e3 = @e_absolute_humidity || cal_e_absolute_humidity

    e_cathode_capacity = ac1/3000*(e2-d2+d3/1000*1.86*(e2-d2))
    @e_cathode_capacity = if e_cathode_capacity.nan?
      Float::NAN
    else
      [e_cathode_capacity, 0].max
    end
  end

  def cal_l_cathode_capacity
    l1 = format_air_mixture_field(air_mixture_input.l_flow_rate)
    l2 = @l_temperature || cal_l_temperature
    l3 = @l_absolute_humidity || cal_l_absolute_humidity
    k2 = k_temperature
    k3 = k_absolute_humidity

    @l_cathode_capacity = l1*1.2/3600*(k2+k3/1000*(2500+1.86*k2)-(l2+l3/1000*(2500+1.86*l2)))
  end

  def cal_s_absolute_humidity
    p3 = format_air_mixture_field(air_mixture_input.p_absolute_humidity)
    k1 = k_flow_rate
    s1 = format_air_mixture_field(air_mixture_input.s_flow_rate)
    j3 = format_air_mixture_field(air_mixture_input.j_absolute_humidity)
    k3 = k_absolute_humidity

    p3 + k1 / s1 * (j3 - k3)
  end

  def cal_l_absolute_humidity
    ac      = format_air_mixture_field(air_mixture_input.atmospheric_pressure)
    ab_humi = k_absolute_humidity
    temp    = @l_temperature || cal_l_temperature

    if 622/(ac/Math.exp(12.03-4025/(temp+235))/10/100 -1) < ab_humi
      l_absolute_humidity = 622/(ac/Math.exp(12.03-4025/(temp+235))/10/100 -1)
    else
      l_absolute_humidity = ab_humi
    end
    @l_absolute_humidity ||= l_absolute_humidity
  end

  def format_air_mixture_field air_mixture_field
    air_mixture_field == "N/A" ? Float::NAN : air_mixture_field.to_f
  end

  def format_special_field air_mixture_field
    (air_mixture_field == "N/A" || air_mixture_field == "") ? Float::NAN : air_mixture_field.to_f
  end
end
