class HomeController < ApplicationController

  def index
		# get public home
		@banners = Banner.all
		@horses = Horse.first(4)
		@facilities = Facility.all
		@articles = Article.first(3)
  end

  def about
		# get public about
		@instructors = Instructor.all
  end

  def services
		# get public about
		@services = Service.all
  end

  def terms
		# get public about
  end

  def privacy
		# get public about
  end

  def event
		# get public about
  end

  def general
		# get public about
  end

end
