class PlacesController < ApplicationController
  before_action :set_place, only: %i[show]

  def index
    @places = Place.all
  end

  def show
    @booking = Booking.new
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :capacity, :price_per_day, :address, :photo)
  end
end
