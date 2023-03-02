class PlacesController < ApplicationController
  before_action :set_place, only: %i[show]

  def index
    if params[:query].present?
      @places = Place.global_search(params[:query])
    else
      @places = Place.all
    end
  end

  def show
    @booking = Booking.new
  end

  # def edit
  # end

  # def update
  #   if @place.update(place_params)
  #     redirect_to owner_place_path(@place)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @place.destroy
    redirect_to owner_places_path, status: :see_other
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :capacity, :price_per_day, :address, :photo)
  end
end
