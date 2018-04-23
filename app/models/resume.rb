class Resume < ApplicationRecord
  has_one :social, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :resume_jobs
  has_many :jobs, through: :resume_jobs
  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :work_experiences, allow_destroy: true
  accepts_nested_attributes_for :educations, allow_destroy: true
  accepts_nested_attributes_for :social,  
    reject_if: ->(attrs) { attrs['facebook_link'.blank?] }, allow_destroy: true

  belongs_to :user

  validates :user_id, presence: true

  def apply job
    self.jobs << job
  end

end
