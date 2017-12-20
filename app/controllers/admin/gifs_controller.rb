class Admin::GifsController < Admin::BaseController

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
    @categories = Category.all
  end

  def create
    gif_generate = Gif.generate(params[:gif][:category_id])
    category = Category.find_by(name: (params[:gif][:category_id]))
    selection = rand(1..50)
    @gif = Gif.new(image_path: gif_generate.data[selection].images.downsized_medium.url, category_id: category.id)
    if @gif.save
      flash[:success] = "Nice! You made a new Gif for #{category.name}!"
      redirect_to admin_gifs_path
    else
      render :new
    end
  end


end
