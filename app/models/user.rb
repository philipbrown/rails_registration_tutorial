class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, email: true, uniqueness: true

  def confirm!
    update!(confirmed_at: DateTime.now)
  end

  def confirmed?
    ! confirmed_at.nil?
  end
end
