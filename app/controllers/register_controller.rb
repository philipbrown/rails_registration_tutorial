class RegisterController < ApplicationController
  def new
    @form = RegisterForm.new(User.new)
  end
end
