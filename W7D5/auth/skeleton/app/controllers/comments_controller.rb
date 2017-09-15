class CommentsController < ApplicationController
  before_action :require_login

  def index
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to link_url(@comment.link_id)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = params[:link_id]
    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def new
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
