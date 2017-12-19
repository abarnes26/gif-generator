class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id)
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

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

    redirect_to user_favorites_path(current_user)
  end

  private

    def favorite_params
      params.permit(:gif_id, :user_id)
    end
end
