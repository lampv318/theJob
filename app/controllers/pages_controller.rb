class PagesController < ApplicationController
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
end
