require "csv"

class ExportProjectCsv
  def initialize project, type, selected_results
    @project = project
    @type = type
    @data_with_type = Settings.export_project_csv[type]
    @selected_results = selected_results
  end

  def execute
    CSV.generate do |csv|
      csv << csv_header
      results_object = results_object_by_type(project, type)
      results_object.each do |result_object|
        data_array = []
        data_array += data_input_array(result_object)
        data_array += data_result_array(result_object)

        csv << data_array
      end
    end
  end

  private
  attr_reader :project, :type, :data_with_type, :selected_results
  def csv_header
    unless type == :unit_selection
      input_header = Hash(data_with_type.inputs).values
    else
      input_header = [data_with_type.mode]
      input_header += Hash(data_with_type.project_info).values
      input_header += Hash(data_with_type.inputs[:si]).values
    end

    result_header = Hash(data_with_type.results).values
    input_header += result_header
  end

  def uni_selection_input_mode input_object
    input_object.unit_selection_object.instance_variable_get("@radiobutton5") == true ? :si : :ip
  end

  def data_input_array result_object
    input_object = result_object.send("#{type.to_s}_input")
    unless type == :unit_selection
      data_with_type.inputs.keys.map{|key| input_object.send(key)}
    else
      mode = uni_selection_input_mode(input_object)
      data_input = [mode.to_s.upcase()]
      data_input += data_with_type.project_info.keys.map{|key| input_object.send(key)}
      data_input += data_with_type.inputs[mode].keys.map do |key|
        input_object.unit_selection_object.instance_variable_get "@#{key.to_s}"
      end
      data_input
    end
  end

  def data_result_array result_object
    data_with_type.results.keys.map{|key| result_object.send(key)}
  end

  def results_object_by_type project, type
    case type
    when :air_mixture
      project.unit_selection_results.where(id: selected_results)
    when :room_calculation
      Array(project.room_calculation_result).reject{|result| result.room_calculation_input_id == nil}
    when :unit_selection
      project.unit_selection_results.where(id: selected_results)
    end
  end
end
