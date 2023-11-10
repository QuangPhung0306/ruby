class AddTimestampForSomeTables < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :air_mixture_inputs
    add_timestamps :m_categories
    add_timestamps :m_correction_factors
    add_timestamps :m_dew_points
    add_timestamps :m_units
    add_timestamps :projects
    add_timestamps :unit_selection_results
  end
end
