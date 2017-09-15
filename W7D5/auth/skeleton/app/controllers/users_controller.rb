class UsersController < ApplicationController
  def index

  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to links_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
