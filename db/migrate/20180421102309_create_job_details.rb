class CreateJobDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :job_details do |t|
      t.integer :job_id
      t.text :content

      t.timestamps
    end
  end
end
