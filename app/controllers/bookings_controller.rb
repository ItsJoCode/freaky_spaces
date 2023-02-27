class BookingsController < ApplicationController

  before_action :set_booking, only: [:show]

  def index
    @bookings = booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date, :place_id, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
