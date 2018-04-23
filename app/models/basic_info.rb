class BasicInfo < ApplicationRecord
  belongs_to :resume
  belongs_to :user

  mount_uploader  :avatar, AvatarUploader
end
