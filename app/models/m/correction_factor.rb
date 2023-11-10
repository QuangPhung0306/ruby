class M::CorrectionFactor < ApplicationRecord
  include M

  scope :by_consorbs, ->{where unit_type: 1}
end
