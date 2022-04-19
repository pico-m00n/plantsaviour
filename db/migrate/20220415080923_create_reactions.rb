class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.integer :end_user_id
      t.integer :answer_id
      t.text :body
      t.timestamps
    end
  end
end
