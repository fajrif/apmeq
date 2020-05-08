class Admins::HorsesController < Admins::BaseController

  def index
    criteria = Horse.where("name LIKE ?", "%#{params[:search]}%")
    @horses = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @horses }
      format.js
    end
  end

  def show
		@horse = Horse.friendly.find(params[:id])
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(params_horse)
    if @horse.save
      redirect_to admins_horse_path(@horse), :notice => "Successfully created horse."
    else
      render :action => 'new'
    end
  end

  def edit
		@horse = Horse.friendly.find(params[:id])
  end

  def update
		@horse = Horse.friendly.find(params[:id])
    if @horse.update_attributes(params_horse)
      redirect_to admins_horse_path(@horse), :notice  => "Successfully updated horse."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@horse = Horse.friendly.find(params[:id])
    @horse.destroy
    redirect_to admins_horses_url, :notice => "Successfully destroyed horse."
  end

  private

  def params_horse
    params.require(:horse).permit(:name, :disciplines, :height, :category_id, :breed, :description, :sex, :year, :color, images: [])
  end

end
