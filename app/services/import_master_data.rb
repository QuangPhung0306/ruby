class ImportMasterData < CsvReader
  def initialize model
    @model = "M::#{model.to_s.classify}".constantize
    super csv_file_path
  end

  def execute
    model.destroy_all
    if model.name == "M::Coefficient"
      model.create data_for_coefficients
    else
      model.create super
    end
  end

  private
  attr_reader :model

  def csv_file_path
    Rails.root.join "db", "master_data",
      "#{model.name.demodulize.tableize}.csv"
  end

  def data_for_coefficients
    data_array = []
    CSV.foreach(csv_file_path, encoding: "Shift_JIS").with_index do |row, index|
      if index < Settings.m_coefficients.number_start
        data_array << {id: row[0].to_i, name: nil, coefa: Array.new(row.size.pred , 0)}
      else
        name, *coefa = row.drop(1)
        coefa = coefa.unshift(0)
        data_array << {id: row[0].to_i, name: name, coefa: coefa}
      end
    end
    data_array
  end
end
