class Job < ApplicationRecord
  has_many :resume_jobs
  has_many :resumes, through: :resume_jobs
  has_one :job_detail, dependent: :destroy

  belongs_to :user
  belongs_to :company

  validates :title, presence: :true, length: {maximum: 50}
end
