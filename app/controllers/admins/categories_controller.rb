class Admins::CategoriesController < Admins::BaseController

  def index
    criteria = Category.where("name LIKE ?", "%#{params[:search]}%")
    @categories = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
      format.js
    end
  end

  def show
		@category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to admins_category_path(@category), :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
		@category = Category.find(params[:id])
  end

  def update
		@category = Category.find(params[:id])
    if @category.update_attributes(params_category)
      redirect_to admins_category_path(@category), :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_url, :notice => "Successfully destroyed category."
  end

  private

  def params_category
    params.require(:category).permit(:name)
  end

end
