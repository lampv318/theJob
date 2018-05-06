class BasicInfo < ApplicationRecord
  belongs_to :resume
  belongs_to :user

  scope :salary_gt, ->(amount) { where('salary > ?', amount)  }
  scope :salary_lt, ->(amount) { where('salary < ?', amount)  }

  mount_uploader :user_avatar, AvatarUploader
end
