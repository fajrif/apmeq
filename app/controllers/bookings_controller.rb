class BookingsController < ApplicationController

	def show
    @booking = Booking.new
	end

  def create
    @booking = Booking.new(params_booking)
    if @booking.save
      redirect_to booking_path, :notice => "Thank you for book with us, our customer services officer will contact you soon."
    else
      redirect_to booking_path, :alert => "Oops! Something went wrong."
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:name, :dob, :instructor_id, :date_lesson, :as_member, :emergency_contact_name, :emergency_contact_phone)
  end
end
