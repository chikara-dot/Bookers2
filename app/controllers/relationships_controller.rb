class RelationshipsController < ApplicationController

  def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end


  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end


  def follows
    @follow = current_user.following_user
  end

  def followers
    @follow = current_user.follower_user
  end
end
