class RoomCalculationResult < ApplicationRecord
  belongs_to :room_calculation_input
  belongs_to :project

  has_many :chart_datas, dependent: :destroy
end
