class AddHpAndTr1ToAirMixtureInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :air_mixture_inputs, :textbox2, :string
    add_column :air_mixture_inputs, :textbox50, :string
  end
end
