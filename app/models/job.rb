require "elasticsearch/model"
class Job < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  ATTRIBUTES_PARAMS = %i(user_id  company_name title description url location 
  employment_type salary working_hour experience education_level).freeze

  scope :by_default, lambda { order created_at: :desc }

  has_many :resume_jobs
  has_many :resumes, through: :resume_jobs
  has_many :job_details, dependent: :destroy

  belongs_to :user

  validates :title, presence: :true, length: {maximum: 50}

  accepts_nested_attributes_for :job_details, allow_destroy: true

  EMPLOYMENT_TYPES = ["Full time", "Part time", "Internship", "Freeelance", "Remote" ].freeze
  EDUCATION_LEVELS = ["Postdoc", "Ph.D", "Master", "Bachelor"].freeze
end
Job.__elasticsearch__.client.indices.delete index: Job.index_name rescue nil
Job.__elasticsearch__.client.indices.create \
  index: Job.index_name,
  body: { settings: Job.settings.to_hash, mappings: Job.mappings.to_hash }
Job.import
