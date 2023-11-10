class AirMixturesController < ApplicationController
  before_action :check_air_mixture_permission
  before_action :set_cache_headers, only: :index
  NOT_UNIT_SELECTION_FIELDS = %w(category unit k_flow_rate m_unit_dry_air warning_messages height_above_sea_level atmospheric_pressure)

  def index
    @m_categories = M::Category.where(key_name: %w(recusorb_1 consorb))
    @m_units = M::Unit.air_mixture.send "#{current_user.area}"
    @project = current_user.projects.build
    @air_mixture_projects = current_user.projects.air_mixture.pluck(:name).to_json
    if params[:reload_project] == "true"
      @reload_project = current_user.projects.air_mixture.find_by name: params[:project_name]
      return unless @reload_project
      @unit_selection_results = @reload_project.unit_selection_results
      @air_mixture_input = @reload_project.air_mixture_inputs.first.to_json
      @is_reload_project = true
    end

    if params[:click_result] == "true"
      @air_mixture_input = AirMixtureInput.find_by(id: params[:id]).to_json
    end
  end

  def create
    params[:air_mixture_input] = JSON.parse(params[:air_mixture_input])
    @air_mixture_input = AirMixtureInput.new(air_mixture_input_params)
    calculation_result = rotor_calculation_result
    return if @error_message.present?
    @warning_messages = calculation_result[:warning_messages]
    @height_above_sea_level = calculation_result[:si][:height_above_sea_level].to_s
    @atmospheric_pressure = calculation_result[:si][:atmospheric_pressure].to_s
    unit_selection_for_calculation = calculation_result[:si].merge(m_unit_dry_air: calculation_result[:m_unit_dry_air])
    @k_relation_value = AirMixture::CalculationKRelationValue.new(@air_mixture_input, unit_selection_for_calculation).execute
    @k_relation_value.each do |field, value|
      @air_mixture_input.send("#{field}=", value)
    end
    @air_mixture_input.atmospheric_pressure = @atmospheric_pressure
    @air_mixture_input.height_above_sea_level = @height_above_sea_level
    if @air_mixture_input.save
      flash.now[:success] = t ".create_successful"
      @unit_selection_result = UnitSelectionResult.new(air_mixture_input_id: @air_mixture_input.id, model_type: 2)

      calculation_result[:si].each do |key, value|
        @unit_selection_result.send("#{key.to_s}=", value) unless NOT_UNIT_SELECTION_FIELDS.include? key.to_s
      end

      @is_success = @unit_selection_result.save

      if params[:air_mixture_input][:calculation_mode] == "si"
        @fill_unit_selection_result = @unit_selection_result
      else
        @unit_selection_result_ip = UnitSelectionResult.new(air_mixture_input_id: @air_mixture_input.id, model_type: 2)
        calculation_result[:ip].each do |key, value|
          @unit_selection_result_ip.send("#{key.to_s}=", value) unless NOT_UNIT_SELECTION_FIELDS.include? key.to_s
        end
        @fill_unit_selection_result = @unit_selection_result_ip
        @fill_unit_selection_result.id = @unit_selection_result.id
      end
    else
      flash.now[:danger] = t ".create_failed"
    end
  end

  private
  def air_mixture_input_params
    params.require(:air_mixture_input).permit AirMixtureInput.column_names
  end

  def check_air_mixture_permission
    return if current_user.admin? || current_user.can_access_air_mixture?
    flash[:danger] = t "not_access_permission"
    redirect_to root_path
  end

  def rotor_calculation_result
    unit = M::Unit.air_mixture.send("#{current_user.area}").find_by id: params[:air_mixture_input]["m_unit_id"].to_i
    return if unit.nil?
    calculation = UnitSelection::AirMixtureResult.new current_user, :air_mixture
    begin
      calculation_result = calculation.execute(unit_name: unit.name, calculation_mode: params[:air_mixture_input][:calculation_mode],
        j_flow_rate: format_param(params[:air_mixture_input][:j_flow_rate_display]),
        j_temperature: format_param(params[:air_mixture_input][:j_temperature_display]),
        j_absolute_humidity: format_param(params[:air_mixture_input][:j_absolute_humidity_display]),
        p_flow_rate: format_param(params[:air_mixture_input][:p_flow_rate_display]),
        p_temperature: format_param(params[:air_mixture_input][:p_temperature_display]),
        p_absolute_humidity: format_param(params[:air_mixture_input][:p_absolute_humidity_display]),
        heater_select: params[:air_mixture_input][:heater_select],
        height_above_sea_level: params[:air_mixture_input][:height_above_sea_level],
        textbox2: params[:air_mixture_input][:textbox2],
        textbox50: params[:air_mixture_input][:textbox50])
      calculation_result.merge(m_unit_dry_air: unit.dry_air, warning_messages: calculation.instance_variable_get(:@warning_messages).to_a)
    rescue StandardError => exception
      @error_message = exception.message.present? ? exception.message : t(".unit_selection_calculation_error")
    end
  end

  def format_param air_mixture_field
    air_mixture_field == "N/A" ? Float::NAN : air_mixture_field.to_f
  end
end
