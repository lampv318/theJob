class ResumesController < ApplicationController
  before_action :check_logged_in, only: %i(new create)

  def index
    @resumes = Resume.by_default.page params[:page]
  end

  def new
    @resume = current_user.resumes.new
    @resume.basic_infos.build
    @resume.socials.build
    @resume.skills.build
    @resume.work_experiences.build
    @resume.educations.build
    @resume.tag_lists.build
  end

  def create
    @resume = current_user.resumes.new resume_params
    if resume.save
      flash[:success] = "Resume has been created !"
      redirect_to root_path
    else
      flash[:alert] = "Some thing went wrong !"
      redirect_to new_user_resume_path(current_user)
    end
  end

  private 

  attr_reader :resume

  def resume_params
    params.require(:resume).permit skills_attributes: %i(name proficiency), 
      work_experiences_attributes: %i(company position date_from date_to description),
      educations_attributes: %i(degree major school_name description date_from date_to),
      socials_attributes: %i(facebook_link google_link twitter_link github_link),
      basic_infos_attributes: %i(user_id full_name headline description avatar location 
        website salary age phone email_address),
      tag_lists_attributes: %i(user_id tag_name)
  end


end
