class ResumesController < ApplicationController
  before_action :check_logged_in, only: %i(new create)

  def index
    @resume = Resume.all
  end

  def new
    @resume = current_user.resumes.new
    @resume.skills.build
    @resume.work_experiences.build
  end

  def create
    @resume = current_user.resumes.new resume_params
    if resume.save
      flash[:sucess] = "Resume has been create !"
      redirect_to root_path
    else
      flash[:alert] = "Fail!"
      render :new
    end
  end

  private 

  attr_reader :resume

  def resume_params
    params.require(:resume).permit skills_attributes: %i( name proficiency ), 
      work_experiences_attributes: %i(company position date_from date_to description)
  end


end
