class JobsController < ApplicationController
  before_action :check_logged_in, only: %i(new create)

  def new 
    @job = current_user.jobs.new
    @job.job_details.build
  end

  def create
    @job = current_user.jobs.new job_params
    if job.save
      flash[:success] = "Job has been created !"
      redirect_to root_path
    else
      flash[:danger] = "Some thing went wrong !"
      redirect_to new_user_job_path(current_user)
    end
  end

  private 

  attr_reader :job

  def job_params
    params.require(:job).permit Job::ATTRIBUTES_PARAMS,
     job_details_attributes: %i(content)
  end
  
end
