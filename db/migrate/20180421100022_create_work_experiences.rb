class CreateWorkExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :work_experiences do |t|
      t.string :resume_id
      t.string :company
      t.string :position
      t.datetime :date_from
      t.datetime :date_to
      t.string :description

      t.timestamps
    end
  end
end
