module SessionsHelper
  def current_job
    @current_job ||= Job.find_by id: session[:user_id]
  end
end
