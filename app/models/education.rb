class Education < ApplicationRecord
  belongs_to :resume

  validates :school_name, presence: :true
end
