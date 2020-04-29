class Admins::BookingsController < Admins::BaseController

  def index
    criteria = Booking.where("name LIKE ?", "%#{params[:search]}%")
    @bookings = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookings }
      format.js
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    if @booking.save
      redirect_to admins_booking_path(@booking), :notice => "Successfully created booking."
    else
      render :action => 'new'
    end
  end

  def show
		@booking = Booking.find(params[:id])
  end

  def edit
		@booking = Booking.find(params[:id])
  end

  def update
		@booking = Booking.find(params[:id])
    if @booking.update_attributes(params_booking)
      redirect_to admins_booking_path(@booking), :notice  => "Successfully updated booking."
    else
      render :action => 'edit'
    end
  end

  def destroy
		@booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to admins_bookings_url, :notice => "Successfully destroyed booking."
  end

  private

  def params_booking
    params.require(:booking).permit(:name, :dob, :instructor_id, :date_lesson, :as_member, :emergency_contact_name, :emergency_contact_phone)
  end
end
