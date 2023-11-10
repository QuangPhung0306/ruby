class RemoveSomeFkFromRoomCalculationInputs < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key "room_calculation_inputs", "m_units"
    remove_foreign_key "chart_data", "room_calculation_results"
    remove_foreign_key "projects", "users"
    remove_foreign_key "room_calculation_inputs", "m_categories"
    remove_foreign_key "room_calculation_inputs", "projects"
    remove_foreign_key "room_calculation_results", "projects"
    remove_foreign_key "room_calculation_results", "room_calculation_inputs"
    remove_foreign_key "user_models", "m_models"
    remove_foreign_key "user_models", "users"
    remove_foreign_key "users", "agencies"
  end
end
