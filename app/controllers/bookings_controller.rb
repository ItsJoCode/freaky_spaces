class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @user = User.find(params(:user_id))
  end

  def show
    @user = User.find(params(:user_id))
  end

  def new
    @user = User.find(params(:user_id))
    @place = Place.find(params(:place_id))
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params(:user_id))
    @place = Place.find(params(:place_id))
    @booking.user = @user
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
