class ManagerResumesController < ApplicationController
  before_action :check_logged_in, only: %i(index)

  def index
    @resumes = current_user.resumes.by_default.page params[:page]
  end
end
