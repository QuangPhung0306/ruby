class RoomCalculationInput < ApplicationRecord
  belongs_to :project
  belongs_to :m_unit, ->{where model_type: 1}, class_name: M::Unit.name
  belongs_to :m_category, class_name: M::Category.name

  has_one :room_calculation_result, dependent: :destroy
  has_one :unit_selection_result, dependent: :destroy

  ROOM_CALCULATION_INPUT_ATTR = RoomCalculationInput.column_names

  delegate :name, to: :m_category, prefix: true
  delegate :name, to: :m_unit, prefix: true
  delegate :name, to: :project, prefix: true

  def format_created_at
    self.project.created_at.strftime Settings.data_time_format.project
  end

  def format_updated_at
    self.project.updated_at.strftime Settings.data_time_format.project
  end
end
