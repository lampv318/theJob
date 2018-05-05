class SearchResumeController < ApplicationController
  before_action :set_search

  def search
    @resumes = @q.result(distin: true).page params[:page]
    render "resumes/index"
  end

  def set_search
    @q= Resume.ransack params[:q]
  end
end
