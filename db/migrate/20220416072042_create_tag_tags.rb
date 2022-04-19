class CreateTagTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_tags do |t|
    t.integer :question_id
    t.integer :post_id
    t.integer :tag_id
      t.timestamps
    end
  end
end
