class UsersController<ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "You've successfully created an account!"
    else
      render :new
    end
  end
end
