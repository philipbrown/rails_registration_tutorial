class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, email: true, uniqueness: true
end
