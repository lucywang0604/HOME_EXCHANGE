class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept, :decline]

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to dashboard_path, notice: "Booking request sent!"
    else
      render "flats/show"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: "Booking updated successfully!"
    else
      render :edit
    end
  end

  def accept
    @booking.accepted!
    redirect_to dashboard_path, notice: "Booking updated successfully!"
  end

  def decline
    @booking.declined!
    redirect_to dashboard_path, notice: "Booking updated successfully!"
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: "Booking deleted!"
  end

  private

  def set_booking
    @booking = Booking.find_by(id: params[:id])

    if @booking.nil?
      redirect_to dashboard_path, alert: "Booking not found!"
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
