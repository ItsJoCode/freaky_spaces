class Owner::PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  def index
    @places = Place.where(user: current_user)
  end

  def show
    @markers = [{
      lat: @place.latitude,
      lng: @place.longitude,
      info_window_html: render_to_string(partial: "places/info_window", locals: {place: @place})
    }]
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to owner_place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @place.update(place_params)
    redirect_to owner_place_path(@place)
  end

  def destroy
    @place.destroy
    redirect_to owner_places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :capacity, :price_per_day, :address, :photo)
  end
end
