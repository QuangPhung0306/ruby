class UserModel < ApplicationRecord
  belongs_to :user
  belongs_to :m_model, class_name: M::Model.name
end
