class Admins::FacilitiesController < Admins::BaseController

  def index
    criteria = Facility.where("name LIKE ?", "%#{params[:search]}%")
    @facilities = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facilities }
      format.js
    end
  end

  def show
		@facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(params_facility)
    if @facility.save
      redirect_to admins_facility_path(@facility), :notice => "Successfully created facility."
    else
      render :action => 'new'
    end
  end

  def edit
		@facility = Facility.find(params[:id])
  end

  def update
		@facility = Facility.find(params[:id])
    if @facility.update_attributes(params_facility)
      redirect_to admins_facility_path(@facility), :notice  => "Successfully updated facility."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to admins_facilities_url, :notice => "Successfully destroyed facility."
  end

  private

  def params_facility
    params.require(:facility).permit(:image, :name, :description, :category_name)
  end

end
