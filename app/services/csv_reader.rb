require "csv"

class CsvReader
  def initialize csv_file_path
    @csv_file_path = csv_file_path
  end

  def execute
    data_array = []
    CSV.foreach csv_file_path, headers: true do |row|
      data_array.push row.to_h
    end
    data_array
  end

  private
  attr_reader :csv_file_path
end
