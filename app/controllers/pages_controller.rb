class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def dashboard
    @my_flats = current_user.flats
    @my_bookings = current_user.bookings
    @received_bookings = current_user.flats.includes(:bookings).map(&:bookings).flatten
  end
end
