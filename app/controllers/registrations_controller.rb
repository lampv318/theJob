class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      sign_in user
      redirect_to jobs_path
    else
      render :new
    end
  end
  
  private

  attr_reader :user

  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
