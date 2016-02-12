# class Project < ActiveRecord::Base
class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :thumb, presence: true
  validates :when_created, presence: true
  validates :description, presence: true
end
