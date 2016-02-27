require "reform/form/validation/unique_validator.rb"

class RegisterForm < Reform::Form
  property :email
  property :password

  validates :email,    presence: true, email: true, unique: true
  validates :password, presence: true

  def save
    sync

    model.roles << Role.find_by(name: :guest)
    model.save
  end
end
