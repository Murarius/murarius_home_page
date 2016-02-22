# class Owner < ActiveRecord::Base
class Owner < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true
end
