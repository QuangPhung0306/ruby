class M::Model < ApplicationRecord
  include M

  has_many :user_models, dependent: :nullify, foreign_key: "m_model_id"
  has_many :users, through: :user_models
end
