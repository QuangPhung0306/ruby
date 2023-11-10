class AddDataToResultR003 < ActiveRecord::Migration[5.2]
  def change
    add_column :room_calculation_results, :result_xp2, :double
    add_column :room_calculation_results, :result_tp2, :double
    add_column :room_calculation_results, :result_mr, :double
  end
end
