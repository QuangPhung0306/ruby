class M::Unit < ApplicationRecord
  include M

  belongs_to :m_category, class_name: M::Category.name, foreign_key: "m_category_id"

  enum applied_area: {asia: 1, other: 2}
  enum model_type: {room_calculation: 1, unit_selection: 2, air_mixture: 3}

  scope :r003_unit, -> {where m_category_id: [1, 3]}

  delegate :name, to: :m_category, allow_nil: true, prefix: true
end
