class ExportCsv::ProjectsController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id])
    @selected_results = params[:selected_results]
    csv_data = ExportProjectCsv.new(@project, @project.calculation_type.to_sym, @selected_results).execute
    file_name = "#{@project.calculation_type.sub(/^./, &:upcase)}_#{@project.name}_#{@project.date_of_project.try(:strftime, Settings.data_time_format.project_export_csv)}.csv"
    send_data csv_data.encode(Encoding::SJIS), filename: file_name
  end
end
