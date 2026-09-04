class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(post_id: params[:post_id].to_i, content: params[:content])
    redirect_back_or_to posts_url
  end

  def destroy
    @content = Comment.find params[:id]
    @content.destroy
    redirect_back_or_to posts_url
  end
end
