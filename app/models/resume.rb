class Resume < ApplicationRecord
  has_one :social, dependent: :destroy
  has_many :education, dependent: :destroy
  has_many :work_experience, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :resume_jobs
  has_many :jobs, through: :resume_jobs

  belongs_to :user

  def apply job
    self.jobs << job
  end

end
