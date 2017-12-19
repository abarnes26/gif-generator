class Favorites < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      flash[:success] = "This gif has been added to your favorites!"
      redirect_to current_path
    else
      flash[:failure] = "Sorry, something went wrong, please select a different gif"
      redirect_to current_path
    end
  end

  private

    def favorite_params
      params.require(:favorite).permit(:user_id, :gif_id)
    end
end
