class ChangeColunmTypeOfUnitSelectionResults < ActiveRecord::Migration[5.2]
  def change
    change_column :unit_selection_results, :rotation, :string
    change_column :unit_selection_results, :diameter, :string
    change_column :unit_selection_results, :depth, :string
    change_column :unit_selection_results, :a_tp1, :string
    change_column :unit_selection_results, :a_xp1, :string
    change_column :unit_selection_results, :a_fp, :string
    change_column :unit_selection_results, :a_vp, :string
    change_column :unit_selection_results, :f_tr1, :string
    change_column :unit_selection_results, :f_xr1, :string
    change_column :unit_selection_results, :f_fr, :string
    change_column :unit_selection_results, :f_vr, :string
    change_column :unit_selection_results, :b_tp2, :string
    change_column :unit_selection_results, :b_xp2, :string
    change_column :unit_selection_results, :b_mr, :string
    change_column :unit_selection_results, :d_tpu2, :string
    change_column :unit_selection_results, :g_tr2, :string
    change_column :unit_selection_results, :g_xr2, :string
    change_column :unit_selection_results, :hp, :string
    change_column :unit_selection_results, :pp, :string
    change_column :unit_selection_results, :pr, :string
    change_column :unit_selection_results, :ppu, :string
    change_column :unit_selection_results, :margin, :string
    change_column :unit_selection_results, :h, :string
    change_column :unit_selection_results, :i, :string
    change_column :unit_selection_results, :j, :string
    change_column :unit_selection_results, :k, :string
    change_column :unit_selection_results, :l, :string
    change_column :unit_selection_results, :m, :string
    change_column :unit_selection_results, :smo_xp2, :string
  end
end
