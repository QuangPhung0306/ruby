class CreateEmailHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :email_histories do |t|
      t.text :content
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
