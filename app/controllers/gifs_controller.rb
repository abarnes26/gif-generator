class GifsController < ApplicationController

  def index
    @categories = Category.all
  end

end
