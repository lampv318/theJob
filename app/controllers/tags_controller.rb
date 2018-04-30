class TagsController < ApplicationController
  def show
    if params[:id]
      @resumes = Resume.tagged_with params[:id]
    end
  end
end
