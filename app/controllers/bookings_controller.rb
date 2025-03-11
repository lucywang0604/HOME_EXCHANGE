class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show]

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.build(booking_params)
    @booking.user = current_user
    @booking.status = "Pending"

    if @booking.save
      redirect_to @booking, notice: "Booking request sent!"
    else
      render "flats/show"
    end
  end

  def show
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
