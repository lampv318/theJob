class ManagerJobsController < ApplicationController
  before_action :check_logged_in, only: %i(index)

  def index
    @jobs = current_user.jobs.by_default.page params[:page]
  end
end
