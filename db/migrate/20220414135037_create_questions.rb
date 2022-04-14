class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :end_user_id
      t.integer :best_answer_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
