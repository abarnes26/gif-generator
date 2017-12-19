class FavoritesController < ApplicationController

  def index
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      flash[:success] = "This gif has been added to your favorites!"
      redirect_to gifs_path
    else
      flash[:notice] = "Sorry, something went wrong. Please select a different gif"
      redirect_to gifs_path
    end
  end

  private

    def favorite_params
      params.permit(:gif_id, :user_id)
    end
end
