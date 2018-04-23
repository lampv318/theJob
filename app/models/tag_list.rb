class TagList < ApplicationRecord
  belongs_to :user
  belongs_to :resume

  validates :tag_name, length: {maximum: 10}
end
