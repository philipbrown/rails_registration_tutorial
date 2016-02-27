require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @subject = User.new
  end

  should have_many(:assignments)
  should have_many(:roles).through(:assignments)

  should validate_presence_of(:email)
  should validate_presence_of(:password)

  test "email should be a valid email" do
    @subject.email = "invalid"
    @subject.valid?

    assert_includes(@subject.errors[:email], "is not an email")
  end

  test "email should be unique" do
    create(:user, email: "email@domain.com")

    @subject.email = "email@domain.com"
    @subject.valid?

    assert_includes(@subject.errors[:email], "has already been taken")
  end

  test "user should be authenticable" do
    user = create(:user, password: "password")

    assert_not(user.authenticate("qwerty"))

    assert(user.authenticate("password"))
  end

  test "should confirm the user" do
    user = create(:user)

    assert_not(user.confirmed?)

    user.confirm!

    assert(user.confirmed?)
  end

  test "user should have role" do
    assert_not(@subject.role? :admin)

    @subject.roles << Role.new(name: "admin")

    assert(@subject.role? :admin)
  end
end
