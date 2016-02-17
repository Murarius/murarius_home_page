# class Project < ActiveRecord::Base
class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 15 }
  validates :thumb, presence: true
  validates :when_created, presence: true
  validates :description, presence: true

  VALID_LINK_REGEX = /\A([a-zA-Z0-9]+(-[a-zA-Z0-9]+)*\.)+[a-zA-Z]{2,}\Z/
  validates :github_link, format: { with: VALID_LINK_REGEX, multiline: true }
  validates :demo_link, format: { with: VALID_LINK_REGEX, multiline: true }
end
