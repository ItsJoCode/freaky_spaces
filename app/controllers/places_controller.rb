class PlacesController < ApplicationController
  before_action :set_place, only: %i[show]

  def index
    @places = Place.all
  end

  def show
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :capacity, :price_per_day, :address, :user_id)
  end
end
