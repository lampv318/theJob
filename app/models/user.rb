class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  ATTRIBUTES_PARAMS = %i(email password password_confirmation name).freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :company_users
  has_many :companies, through: :company_users
  has_many :jobs
  has_many :tag_lists
  has_many :basic_infos

  validates :email, presence: true, length: {maximum: 255}, 
    format: {with: VALID_EMAIL_REGEX}
  validates :account_name, presence: true

  def correct_user? user
    self == user
  end
end
