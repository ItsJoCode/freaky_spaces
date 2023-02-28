class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @place = Place.find(params[:place_id])
    @booking.user = current_user
    @booking.place = @place
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
