class CommentsController < ApplicationController
  before_action :get_commentable, only: [ :create ]

  def create
    @comment = Comment.create(user: current_user, commentable: @commentable, content: params[:content])
    redirect_back_or_to posts_url
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_back_or_to posts_url
  end

  private

  def get_commentable
    @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
  end
end
