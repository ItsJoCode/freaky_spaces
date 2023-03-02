class PlacesController < ApplicationController
  before_action :set_place, only: %i[show]

  def index
    @places = Place.all
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @place.latitude,
      lng: @place.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {place: @place})
    }]
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :capacity, :price_per_day, :address, :photo)
  end
end
