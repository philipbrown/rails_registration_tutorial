require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @subject = User.new
  end

  should validate_presence_of(:email)

  test "email should be a valid email" do
    @subject.email = "invalid"
    @subject.valid?

    assert_includes(@subject.errors[:email], "is not an email")
  end
end
