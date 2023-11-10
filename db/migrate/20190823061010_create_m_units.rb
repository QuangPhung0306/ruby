class CreateMUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :m_units do |t|
      t.string :name
      t.string :key_name
      t.integer :sort
      t.integer :m_category_id
      t.float :p_reg
      t.integer :dry_air
      t.integer :wet_air
      t.float :by_pass1
      t.float :by_pass2
      t.integer :rot
      t.integer :diam
      t.integer :hub
      t.integer :spokes
      t.float :area
      t.integer :thickn
      t.float :process
      t.float :pu1
      t.float :reg
      t.float :pu2
      t.integer :security_margin
      t.integer :coefficient
      t.integer :rotor
      t.float :capacity
    end
  end
end
