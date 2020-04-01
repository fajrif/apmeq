class Admins::BannersController < Admins::BaseController

  def index
    criteria = Banner.where("caption1 LIKE ?", "%#{params[:search]}%")
    @banners = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banners }
      format.js
    end
  end

  def show
		@banner = Banner.find(params[:id])
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params_banner)
    if @banner.save
      redirect_to admins_banner_path(@banner), :notice => "Successfully created banner."
    else
      render :action => 'new'
    end
  end

  def edit
		@banner = Banner.find(params[:id])
  end

  def update
		@banner = Banner.find(params[:id])
    if @banner.update_attributes(params_banner)
      redirect_to admins_banner_path(@banner), :notice  => "Successfully updated banner."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to admins_banners_url, :notice => "Successfully destroyed banner."
  end

  private

  def params_banner
    params.require(:banner).permit(:link, :caption1, :caption2, :caption3, :description, :image)
  end

end
