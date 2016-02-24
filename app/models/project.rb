# class Project < ActiveRecord::Base
class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 15 }
  validates :thumb, presence: true

  VALID_WHEN_REGEX = /\A([a-zA-Z]{3,15}) [0-9]{4}\Z/
  validates :when_created, presence: true, format: { with: VALID_WHEN_REGEX, multiline: true }

  validates :description, presence: true

  mount_uploader :thumb, ThumbUploader

  VALID_LINK_REGEX = /\A([a-zA-Z0-9]+(-[a-zA-Z0-9]+)*\.)+[a-zA-Z]{2,}([\/]{1}[_\-a-zA-Z0-9]+)*\Z/
  validates :github_link, format: { with: VALID_LINK_REGEX, multiline: true }

  validates :demo_link, format: { with: VALID_LINK_REGEX, multiline: true }
end
