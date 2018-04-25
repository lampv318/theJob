class JobsController < ApplicationController
  before_action :check_logged_in, only: %i(new create)
  before_action :find_job, except: %i(new index create)

  def index
    @jobs = Job.by_default.page params[:page]
  end

  def show
  end

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

  def edit
  end

  def update
    if @job.update_attributes job_params
      flash[:success] = "Update success"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @job.delete
      flash[:sucess] = "Delete completed"
      redirect_to root_path
    end
  end

  private 

  attr_reader :job

  def job_params
    params.require(:job).permit Job::ATTRIBUTES_PARAMS,
     job_details_attributes: %i(content)
  end

  def find_job
    @job = Job.find_by id: params[:id]
    if @job.nil?
      flash[:danger] = "Can't find Job"
      redirect_to root_url
    end
  end
  
end
