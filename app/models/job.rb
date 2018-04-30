class Job < ApplicationRecord

  ATTRIBUTES_PARAMS = %i(user_id  company_name title description url location 
  employment_type salary working_hour experience education_level).freeze

  scope :by_default, lambda { order created_at: :desc }
  scope :salary_gt, ->(amount) { where('salary > ?', amount)  }
  scope :salary_lt, ->(amount) { where('salary < ?', amount)  }

  has_many :resume_jobs
  has_many :resumes, through: :resume_jobs
  has_many :job_details, dependent: :destroy

  belongs_to :user

  validates :title, presence: :true, length: {maximum: 50}

  accepts_nested_attributes_for :job_details, allow_destroy: true

  EMPLOYMENT_TYPES = ["Full time", "Part time", "Internship", "Freelance", "Remote" ].freeze
  EDUCATION_LEVELS = ["Postdoc", "Ph.D", "Master", "Bachelor"].freeze
end
