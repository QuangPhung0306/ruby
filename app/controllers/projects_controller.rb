class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects.send(params[:model])
      .page(params[:page]).per 10
  end

  def create
    if params[:save_from_unit_selection] == "true"
      params[:project] = JSON.parse(params[:project])
      old_project = current_user.projects.unit_selection.find_by name: params[:project][:name]
      unit_selection_result_ids = params[:unit_selection_result_ids].split('_').reject{|id| id == ""}
    else
      old_project = current_user.projects.air_mixture.find_by name: params[:project][:name]
      unit_selection_result_ids = params[:check] || []
    end

    @project = old_project.present? ? old_project : current_user.projects.build(project_params)

    if unit_selection_result_ids.present?
      ActiveRecord::Base.transaction do
        @project.date_of_project = params[:project]["date_of_project"]
        @project.save!
        unit_selection_results = UnitSelectionResult.by_ids unit_selection_result_ids
        if params[:save_from_unit_selection] == "true"
          assign_project_for_unit_selection unit_selection_results
        else
          assign_project_for_airmixture unit_selection_results
        end
        @export_project_csv_url = export_csv_projects_path(project_id: @project.id, selected_results: unit_selection_result_ids)
        flash.now[:success] = t ".create_successful"
      rescue
        flash.now[:danger] = t ".create_failed"
      end
    else
      flash.now[:danger] = t ".not_exits_unit_selection_result"
    end
  end

  private
  def project_params
    params.require(:project).permit Project.column_names
  end

  def assign_project_for_airmixture unit_selection_results
    # Refactor code
    # AirMixtureInput.without_project_id.destroy_all
    # UnitSelectionResult.without_project_id.destroy_all
    unit_selection_results.each do |unit_selection_result|
      if unit_selection_result.project.blank?
        unit_selection_result.project = @project
        unit_selection_result.air_mixture_input.project = @project
      elsif unit_selection_result.project.present? && unit_selection_result.project_id != @project.id
        unit_selection_result = unit_selection_result.dup
        air_mixture_input = unit_selection_result.air_mixture_input.dup
        unit_selection_result.assign_attributes air_mixture_input: air_mixture_input, project: @project
        air_mixture_input.assign_attributes project: @project
      end
      unit_selection_result.save!
      unit_selection_result.air_mixture_input.save!
    end
  end

  def assign_project_for_unit_selection unit_selection_results
    unit_selection_results.each do |unit_selection_result|
      if unit_selection_result.project.blank?
        unit_selection_result.project = @project
      elsif unit_selection_result.project.present? && unit_selection_result.project_id != @project.id
        unit_selection_result = unit_selection_result.dup
        unit_selection_input = unit_selection_result.unit_selection_input.dup
        unit_selection_result.assign_attributes unit_selection_input: unit_selection_input, project: @project
      end
      unit_selection_result.save!
      unit_selection_result.unit_selection_input.save!
    end
  end
end
