class SessionsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      redirect_to links_url
    else
      flash[:errors] = "@user.errors.full_messages"
      render :new
    end
  end

  def new
  end
end
