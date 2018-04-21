class CompanyUser < ApplicationRecord
  belongs_to :users
  belongs_to :companies
  validates :user_id, presence: true
  validates :company_id, presence: true
end
