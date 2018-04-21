class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :title
      t.string :description
      t.string :url
      t.string :location
      t.string :employment_type
      t.string :salary
      t.integer :working_hour
      t.float :experience
      t.string :education_level
      t.string :status, default: "Pending approval"

      t.timestamps
    end
  end
end
