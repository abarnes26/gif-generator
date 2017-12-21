class FavoritesController < ApplicationController

  def index
    if current_user
       @favorites  = Favorite.where(user_id: current_user.id)
       @categories =  @favorites.map do |favorite|
                       favorite.gif.category.name
                      end
    else
      redirect_to new_user_path
    end
  end

  def new
    @favorite = Favorite.new
  end

  def create
    if current_user
      @favorite = Favorite.new(favorite_params)
      if @favorite.save
        flash[:notice] = "This gif has been added to your favorites!"
      else
        flash[:notice] = "Sorry, something went wrong. Please select a different gif"
      end
    else
      redirect_to new_user_path
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
