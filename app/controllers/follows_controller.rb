class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @follow = current_user.followings.build follow_params
    if @follow.save
    else
    end
  end

  def destroy
    @follow = Follow.find params[:id]
    @follow.destroy
    redirect_back_or_to posts_url
  end

  private

  def follow_params
    params.expect(follow: [ :following ])
  end
end
