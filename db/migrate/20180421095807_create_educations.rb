class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.integer :resume_id
      t.string :avatar
      t.string :degree
      t.string :major
      t.string :school_name
      t.string :description
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
