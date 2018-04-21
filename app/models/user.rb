class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :company_users
  has_many :companies, through: :company_users
  has_many :jobs

  validates :email, presence: true, length: {maximum: 255}, 
    format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true
end
