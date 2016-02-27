require "test_helper"

class RegisterFormTest < ActiveSupport::TestCase
  def setup
    @user = User.new
    @form = RegisterForm.new(@user)
  end

  test "email should be required" do
    @form.validate({})

    assert_includes(@form.errors[:email], "can't be blank")
  end

  test "password should be required" do
    @form.validate({})

    assert_includes(@form.errors[:password], "can't be blank")
  end

  test "email should be a valid email address" do
    @form.validate(email: "invalid")

    assert_includes(@form.errors[:email], "is not an email")
  end

  test "email should be unique" do
    create(:user, email: "name@domain.com")

    @form.validate(email: "name@domain.com")

    assert_includes(@form.errors[:email], "has already been taken")
  end

  test "should create new unconfirmed guest user" do
    create(:role, name: "guest")

    @form.validate(email: "name@domain.com", password: "password")

    assert(@form.save)
    assert_not(@user.confirmed?)
    assert(@user.role?(:guest), "user does not have the role of :guest")
  end
end
