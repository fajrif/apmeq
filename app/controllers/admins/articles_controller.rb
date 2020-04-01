class Admins::ArticlesController < Admins::BaseController

  def index
    criteria = Article.where("title LIKE ?", "%#{params[:search]}%")
    @articles = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.js
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    if @article.save
      redirect_to admins_article_path(@article), :notice => "Successfully created article."
    else
      render :action => 'new'
    end
  end

  def show
		@article = Article.friendly.find(params[:id])
  end

  def edit
		@article = Article.friendly.find(params[:id])
  end

  def update
		@article = Article.friendly.find(params[:id])
    if @article.update_attributes(params_article)
      redirect_to admins_article_path(@article), :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@article = Article.friendly.find(params[:id])
    @article.destroy
    redirect_to admins_articles_url, :notice => "Successfully destroyed article."
  end

  private

  def params_article
    params.require(:article).permit(:title, :image, :description, :category_id)
  end
end
