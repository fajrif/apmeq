class Admins::GalleriesController < Admins::BaseController

  def index
    criteria = Gallery.where("caption LIKE ?", "%#{params[:search]}%")
    @galleries = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
      format.js
    end
  end

  def show
		@gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params_gallery)
    if @gallery.save
      redirect_to admins_gallery_path(@gallery), :notice => "Successfully created gallery."
    else
      render :action => 'new'
    end
  end

  def edit
		@gallery = Gallery.find(params[:id])
  end

  def update
		@gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params_gallery)
      redirect_to admins_gallery_path(@gallery), :notice  => "Successfully updated gallery."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to admins_galleries_url, :notice => "Successfully destroyed gallery."
  end

  private

  def params_gallery
    params.require(:gallery).permit(:image, :caption)
  end

end
