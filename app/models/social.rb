class Social < ApplicationRecord
  belongs_to :resume
  
  validates :facebook_link, presence: :true
end
