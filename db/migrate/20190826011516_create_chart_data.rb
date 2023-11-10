class CreateChartData < ActiveRecord::Migration[5.2]
  def change
    create_table :chart_data do |t|
      t.float :elapsed_time, null: false
      t.float :moisture_content, null: false
      t.references :room_calculation_result, foreign_key: true, null: false

      t.timestamps
    end
  end
end
