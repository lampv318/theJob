class PagesController < ApplicationController
  before_action :set_search

  def home
    @jobs = Job.all.by_default
  end

  def contact
  end

  def about
  end

  def help
  end

  def blog
  end

  def pricing
  end

  def set_search
    @q = Job.search params[:q]
  end
end
