class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @follow = current_user.followings.build(following_id: params[:following_id])
    redirect_back_or_to posts_url
  end

  def destroy
    @follow = Follow.find params[:id]
    @follow.destroy
    redirect_back_or_to posts_url
  end
end
