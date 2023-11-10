class ExportCsvController < ApplicationController
  before_action :check_admin_permission

  def index
    csv = ExportUsersCsv.new User.normal.includes :agency, :m_models
    send_data csv.execute, filename: Settings.export_csv.users_csv_file_name
  end
end
