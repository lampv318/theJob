class JobsController < ApplicationController
  before_action :check_logged_in, only: %i(new create)
  before_action :find_job, except: %i(new index create)
  before_action :set_search

  def index
    if params[:q].nil?
      @jobs = Job.by_default.page params[:page]
    else
      @jobs = @q.result(distin: true).page params[:page]
    end
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

  def apply
    @resumes = current_user.resumes.by_default.page params[:page]
  end

  def create_apply
    @resume = Resume.find_by id: params[:resume_id]
    if @job.resumes.find_by id: params[:resume_id]
      flash[:danger] = "You have applied , Please come back later"
      redirect_to root_path
    else
      return if !@resume.apply @job
        flash[:success] = "Congratulation! You have applied job successfully !"
        redirect_to root_path
    end
  end

  def set_search
    @q= Job.ransack params[:q]
  end

  private 

  attr_reader :job

  def job_params
    params.require(:job).permit Job::ATTRIBUTES_PARAMS,
     job_details_attributes: %i(content)
  end

  def find_job
    @job = Job.find_by id: params[:id]
    return if @job
      flash[:danger] = "Can't find Job"
      redirect_to root_url
  end
  
end
