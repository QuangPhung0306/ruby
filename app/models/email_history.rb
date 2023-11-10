class EmailHistory < ApplicationRecord
  belongs_to :sender_user, class_name: User.name, foreign_key: :sender_id
  belongs_to :receiver_user, class_name: User.name, foreign_key: :receiver_id
end
