class SessionsController < Devise::SessionsController
  def new
  end

  def create
    user = User.find_by email: sign_in_params[:email]
    # if user && user.valid_password?(sign_in_params[:password])
    if user
      sign_in user
      flash[:success] = "Sign in Success"
      redirect_to jobs_path
    else
      flash[:danger] = "User or password incorrect"
      redirect_to jobs_path
    end
  end

  def destroy
    if user_signed_in?
      sign_out current_user
      flash[:success] = "Sign out !"
      redirect_to login_path
    else
      flash[:danger] = "Not log in !"
      redirect_to root_path
    end
  end

  private

  attr_accessor :user

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
