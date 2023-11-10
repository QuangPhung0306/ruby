class Agency < ApplicationRecord
  has_many :users, dependent: :nullify
end
