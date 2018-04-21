class Company < ApplicationRecord
  has_many :company_users, dependent: :destroy
  has_many :users, through: :company_users
  has_many :jobs, dependent: :destroy
  has_one :social_company, dependent: :destroy
  has_one :company_detail, dependent: :destroy

  validates :name, presence: :true, length: {maximum: 50}
end
