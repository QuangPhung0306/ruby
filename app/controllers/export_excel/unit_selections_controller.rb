require "rubyXL/convenience_methods"

class ExportExcel::UnitSelectionsController < ApplicationController
  def create
    unit_selection_result = UnitSelectionInput.find_by id: params[:id]
    datavalue = unit_selection_result.unit_selection_object.instance_variable_get "@datavalue" if unit_selection_result
    excel_template_path = Rails.root.join "db", "master_data", "Graph_templete.xlsx"
    
    workbook = RubyXL::Parser.parse excel_template_path
    worksheet = workbook["data"]
    worksheet[3][2].change_contents(datavalue.first[3].to_f.round(1), worksheet[3][2].formula)
    worksheet[3][3].change_contents(datavalue.first[4].to_f.round(5), worksheet[3][3].formula)
    worksheet[4][2].change_contents(datavalue.first[9].to_f.round(1), worksheet[4][2].formula)
    worksheet[4][3].change_contents(datavalue.first[10].to_f.round(5), worksheet[4][3].formula)

    category_name = unit_selection_result.unit_selection_object.instance_variable_get("@combobox2")

    if category_name == "Consorb"
      worksheet[3][5].change_contents(datavalue.first[32].to_f.round(1), worksheet[3][5].formula)
      worksheet[3][6].change_contents(datavalue.first[33].to_f.round(5), worksheet[3][6].formula)
      worksheet[4][5].change_contents(datavalue.first[32].to_f.round(1), worksheet[4][5].formula)
      worksheet[4][6].change_contents(datavalue.first[33].to_f.round(5), worksheet[4][6].formula)
    else
      worksheet[3][5].change_contents(datavalue.first[40].to_f.round(1), worksheet[3][5].formula)
      worksheet[3][6].change_contents(datavalue.first[41].to_f.round(5), worksheet[3][6].formula)
      worksheet[4][5].change_contents(datavalue.first[30].to_f.round(1), worksheet[4][5].formula)
      worksheet[4][6].change_contents(datavalue.first[31].to_f.round(5), worksheet[4][6].formula)
    end

    worksheet[5][5].change_contents(datavalue.first[6].to_f.round(1), worksheet[5][5].formula)
    worksheet[5][6].change_contents(datavalue.first[7].to_f.round(5), worksheet[5][6].formula)
    worksheet[6][5].change_contents(datavalue.first[12].to_f.round(1), worksheet[6][5].formula)
    worksheet[6][6].change_contents(datavalue.first[13].to_f.round(5), worksheet[6][6].formula)

    respond_to do |format|
      format.xlsx do
        send_data workbook.stream.string, filename: "Graph_templete.xlsx"
      end
    end
  end
end
