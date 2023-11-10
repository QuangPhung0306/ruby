class AirMixturePreviewAndPrintController < ApplicationController
  before_action :set_cache_headers, only: :show

  def show
    @data_preview_and_print = AirMixtureInput.find_by id: params[:air_mixture_input_id]
    project = Project.new name: params[:project_name],
      date_of_project: params[:project_date], calculation_type: :air_mixture, user: current_user
    @data_preview_and_print.project = project
    @air_mixture_calculation_mode = params[:air_mixture_calculation_mode]
  end
end
