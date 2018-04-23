class Social < ApplicationRecord
  ATTRIBUTES_PARAMS = %i(facebook_link google_link github_link youtube_link instagram_link _destroy) 

  belongs_to :resume
end
