class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to "#{places_path}#my-cards"
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to places_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:place_id, :user_id)
  end
end
