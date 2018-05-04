class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  ATTRIBUTES_PARAMS = %i(email password password_confirmation account_name).freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :basic_infos, dependent: :destroy
  has_many :resumes, dependent: :destroy
  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users
  has_many :jobs, dependent: :destroy
  has_many :messages , dependent: :destroy

  validates :email, presence: true, length: {maximum: 255}, 
    format: {with: VALID_EMAIL_REGEX}
  validates :account_name, presence: true

  def correct_user? user
    self == user
  end
end
