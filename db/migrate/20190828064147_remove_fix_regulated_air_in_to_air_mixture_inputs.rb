class RemoveFixRegulatedAirInToAirMixtureInputs < ActiveRecord::Migration[5.2]
  def change
    remove_column :air_mixture_inputs, :fix_regulated_air_in
  end
end
