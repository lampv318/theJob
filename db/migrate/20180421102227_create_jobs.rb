class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :company_name
      t.string :company_avatar
      t.string :title
      t.string :description
      t.string :url
      t.string :location
      t.string :employment_type
      t.integer :salary
      t.integer :working_hour
      t.integer :experience
      t.string :education_level
      t.string :status, default: "Pending approval"

      t.timestamps
    end
  end
end
