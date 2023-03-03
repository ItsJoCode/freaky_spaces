class PlacesController < ApplicationController
  before_action :set_place, only: %i[show]

  def index
    @bookmarks = Bookmark.where(user_id: current_user)
    bookmarked_places = Place.left_joins(:bookmarks)
                            .where(bookmarks: { user_id: current_user })
                            .order("bookmarks.id DESC")
    non_bookmarked_places = Place.all.select { |place| place unless bookmarked_places.include?(place) }
    @places = bookmarked_places + non_bookmarked_places

    if params[:query].present?
      @places = Place.global_search(params[:query])
    else
      @places
    end
  end

  def show
    if @place.user == current_user
      redirect_to owner_place_path(@place)
    else
      @booking = Booking.new
      @markers = [{
        lat: @place.latitude,
        lng: @place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {place: @place})
      }]
    end
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
