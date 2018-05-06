class SearchController < ApplicationController
  before_action :set_search

  def search
    @jobs_res = @q.result distin: true
    if params[:rate] == "option1"
      @jobs = @jobs_res.salary_lt(50).page params[:page]
    elsif params[:rate] == "option2"
      @jobs = @jobs_res.salary_gt(50).salary_lt(100).page params[:page]
    elsif params[:rate] == "option3"
      @jobs = @jobs_res.salary_gt(100).salary_lt(200).page params[:page]
    elsif params[:rate] == "option4"
      @jobs = @jobs_res.salary_gt(200).page params[:page]
    else
      @jobs = @jobs_res.page params[:page]
    end
    render "jobs/index"
  end

  def set_search
    @q= Job.ransack params[:q]
  end

end
