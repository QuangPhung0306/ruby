class M::Category < ApplicationRecord
  include M

  has_many :m_units, class_name: M::Unit.name, foreign_key: "m_category_id", dependent: :destroy

  scope :r003_category, -> {where key_name: ["recusorb_1" ,"consorb"]}
end
