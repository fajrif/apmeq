class Admins::InstructorsController < Admins::BaseController

  def index
    criteria = Instructor.where("name LIKE ?", "%#{params[:search]}%")
    @instructors = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @instructors }
      format.js
    end
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(params_instructor)
    if @instructor.save
      redirect_to admins_instructor_path(@instructor), :notice => "Successfully created instructor."
    else
      render :action => 'new'
    end
  end

  def show
		@instructor = Instructor.find(params[:id])
  end

  def edit
		@instructor = Instructor.find(params[:id])
  end

  def update
		@instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(params_instructor)
      redirect_to admins_instructor_path(@instructor), :notice  => "Successfully updated instructor."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to admins_instructors_url, :notice => "Successfully destroyed instructor."
  end

  private

  def params_instructor
    params.require(:instructor).permit(:name, :title, :image, :profile)
  end
end
