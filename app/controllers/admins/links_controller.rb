class Admins::LinksController < Admins::BaseController

  def index
    criteria = Link.where("name LIKE ?", "%#{params[:search]}%")
    @links = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
      format.js
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params_link)
    if @link.save
      redirect_to admins_link_path(@link), :notice => "Successfully created link."
    else
      render :action => 'new'
    end
  end

  def show
		@link = Link.find(params[:id])
  end

  def edit
		@link = Link.find(params[:id])
  end

  def update
		@link = Link.find(params[:id])
    if @link.update_attributes(params_link)
      redirect_to admins_link_path(@link), :notice  => "Successfully updated link."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@link = Link.find(params[:id])
    @link.destroy
    redirect_to admins_links_url, :notice => "Successfully destroyed link."
  end

  private

  def params_link
    params.require(:link).permit(:name, :caption, :url)
  end
end
