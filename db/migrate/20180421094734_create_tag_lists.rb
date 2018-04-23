class CreateTagLists < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_lists do |t|
      t.string :tag_name
      t.integer :user_id
      t.integer :resume_id

      t.timestamps
    end
  end
end
