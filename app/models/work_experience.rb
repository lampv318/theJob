class WorkExperience < ApplicationRecord
  belongs_to :resume

  validates :company, presence: :true
end
