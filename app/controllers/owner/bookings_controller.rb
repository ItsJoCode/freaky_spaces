class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def destroy
    @booking.destroy
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
