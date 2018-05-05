class Education < ApplicationRecord
  belongs_to :resume

  validates :school_name, presence: :true

  DEGREES = ["Postdoc", "Ph.D", "Master", "Bachelor"].freeze
end
