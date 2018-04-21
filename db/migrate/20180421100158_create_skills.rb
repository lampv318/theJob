class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.integer :resume_id
      t.string :name
      t.integer :proficiency

      t.timestamps
    end
  end
end
