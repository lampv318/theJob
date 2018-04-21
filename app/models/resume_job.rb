class ResumeJob < ApplicationRecord
  belongs_to :resume
  belongs_to :job
  validates :resume_id, presence: true
  validates :job_id, presence: true
end
