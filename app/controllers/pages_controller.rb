class PagesController < ApplicationController
  def home
    @jobs = Job.by_default.limit(5)
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
