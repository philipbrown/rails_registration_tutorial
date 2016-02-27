class RegisterController < ApplicationController
  def new
    @form = RegisterForm.new(User.new)
  end

  def create
    @form = RegisterForm.new(User.new)

    if @form.validate(register_params)
      @form.save
      redirect_to "/"
    else
      render :new, status: 400
    end
  end

  private
    def register_params
      params.require(:register).permit(:email, :username, :password)
    end
end
