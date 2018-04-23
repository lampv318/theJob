class Skill < ApplicationRecord
  belongs_to :resume

  validates :name, presence: :true, length: {maximum: 15}
  validates :proficiency, numericality: {less_than: 100, greate_than: 1}
end
