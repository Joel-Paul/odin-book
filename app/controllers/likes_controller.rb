class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_id: params[:post_id].to_i)
    redirect_back_or_to posts_url
  end

  def destroy
    @like = Like.find params[:id]
    @like.destroy
    redirect_back_or_to posts_url
  end
end
