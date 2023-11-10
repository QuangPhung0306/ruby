class CreateUnitSelectionResults < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_selection_results do |t|
      t.integer :project_id
      t.integer :rotation
      t.integer :diameter
      t.integer :depth
      t.float :a_tp1
      t.float :a_xp1
      t.integer :a_fp
      t.float :a_vp
      t.float :f_tr1
      t.float :f_xr1
      t.integer :f_fr
      t.float :f_vr
      t.float :b_tp2
      t.float :b_xp2
      t.float :b_mr
      t.float :d_tpu2
      t.float :g_tr2
      t.float :g_xr2
      t.float :hp
      t.float :pp
      t.float :pa
      t.float :ppu
      t.float :margin
      t.integer :h
      t.integer :i
      t.integer :j
      t.integer :k
      t.integer :l
      t.integer :m
      t.string :status
      t.float :smo_xp2
    end
  end
end
