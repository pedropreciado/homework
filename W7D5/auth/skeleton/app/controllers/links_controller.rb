class LinksController < ApplicationController
  before_action :require_login

  def index
  end

  def edit
  end

  def show
  end


  def update
    @link = current_user.links.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def new
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
