class CreateResumeJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :resume_jobs do |t|
      t.integer :resume_id
      t.integer :job_id

      t.timestamps
    end
  end
end
