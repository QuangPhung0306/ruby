namespace :master_data do
  desc "import master data"
  task import: :environment do
    %i(models dew_points categories units correction_factors coefficients).each do |model|
      ImportMasterData.new(model).execute
    end
  end

  task :single_model, [:model] => :environment do |t, args|
    ImportMasterData.new(args[:model].to_sym).execute
  end
end

