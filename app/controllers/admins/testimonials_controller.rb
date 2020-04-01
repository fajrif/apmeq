class Admins::TestimonialsController < Admins::BaseController

  def index
    criteria = Testimonial.where("name LIKE ?", "%#{params[:search]}%")
    @testimonials = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testimonials }
      format.js
    end
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(params_testimonial)
    if @testimonial.save
      redirect_to admins_testimonial_path(@testimonial), :notice => "Successfully created testimonial."
    else
      render :action => 'new'
    end
  end

  def show
		@testimonial = Testimonial.find(params[:id])
  end

  def edit
		@testimonial = Testimonial.find(params[:id])
  end

  def update
		@testimonial = Testimonial.find(params[:id])
    if @testimonial.update_attributes(params_testimonial)
      redirect_to admins_testimonial_path(@testimonial), :notice  => "Successfully updated testimonial."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to admins_testimonials_url, :notice => "Successfully destroyed testimonial."
  end

  private

  def params_testimonial
    params.require(:testimonial).permit(:name, :title, :comment, :image)
  end
end
