class SearchController < ApplicationController
  before_action :set_search

  def search
    @jobs = @q.result(distin: true).page params[:page]
    render "jobs/index"
  end

  def set_search
    @q= Job.ransack params[:q]
  end
end
