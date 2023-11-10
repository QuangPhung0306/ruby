require "csv"

class ExportUsersCsv
  def initialize users
    @users = users
  end

  def execute
    CSV.generate do |csv|
      csv << Settings.export_csv.users_csv_header
      users.each do |user|
        csv << [user.id, user.email, user.agency_name, user.is_active,
          user.can_access_room_calculation? ? Settings.boolean_integer.true : Settings.boolean_integer.false,
          user.can_access_unit_selection? ? Settings.boolean_integer.true : Settings.boolean_integer.false,
          user.can_access_air_mixture? ? Settings.boolean_integer.true : Settings.boolean_integer.false,
          User.areas[user.area]]
      end
    end
  end

  private
  attr_reader :users
end
