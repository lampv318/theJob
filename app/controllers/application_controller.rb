class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def check_logged_in
    unless user_signed_in?
      redirect_to login_path
      flash[:danger] = "please log in "
    end
  end

end
