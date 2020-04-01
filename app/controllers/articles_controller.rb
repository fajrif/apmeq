class ArticlesController < ApplicationController
	before_action :set_categories

  def index
		if params[:category]
			@category = Category.friendly.find(params[:category])
			criteria = @category.articles
		else
			criteria = Article.where("title LIKE ?", "%#{params[:search]}%")
		end
		@articles = criteria.page(params[:page]).per(6)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.js
    end
  end

  def show
		@article = Article.friendly.find(params[:id])
  end

	protected

	def set_categories
		@recent_articles = Article.last(4)
		@categories = Category.all
	end

end
