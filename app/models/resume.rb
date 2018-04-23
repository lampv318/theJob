class Resume < ApplicationRecord
  has_many :basic_infos, dependent: :destroy
  has_many :socials, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :resume_jobs
  has_many :jobs, through: :resume_jobs
  has_many :tag_lists, dependent: :destroy

  accepts_nested_attributes_for :basic_infos, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :work_experiences, allow_destroy: true
  accepts_nested_attributes_for :educations, allow_destroy: true
  accepts_nested_attributes_for :socials, allow_destroy: true
  accepts_nested_attributes_for :tag_lists, allow_destroy: true

  belongs_to :user

  validates :user_id, presence: true

  def apply job
    self.jobs << job
  end

end
