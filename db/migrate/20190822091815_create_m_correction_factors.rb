class CreateMCorrectionFactors < ActiveRecord::Migration[5.2]
  def change
    create_table :m_correction_factors do |t|
      t.integer :temperature
      t.float :factor_k
      t.integer :factor_correction
      t.integer :unit_type
    end
  end
end
