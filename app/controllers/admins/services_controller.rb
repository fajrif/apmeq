class Admins::ServicesController < Admins::BaseController

  def index
    criteria = Service.where("name LIKE ?", "%#{params[:search]}%")
    @services = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @services }
      format.js
    end
  end

  def show
		@service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params_service)
    if @service.save
      redirect_to admins_service_path(@service), :notice => "Successfully created service."
    else
      render :action => 'new'
    end
  end

  def edit
		@service = Service.find(params[:id])
  end

  def update
		@service = Service.find(params[:id])
    if @service.update_attributes(params_service)
      redirect_to admins_service_path(@service), :notice  => "Successfully updated service."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@service = Service.find(params[:id])
    @service.destroy
    redirect_to admins_services_url, :notice => "Successfully destroyed service."
  end

  private

  def params_service
    params.require(:service).permit(:image, :name, :description)
  end

end
