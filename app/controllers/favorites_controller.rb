class FavoritesController < ApplicationController
  before_action :set_video, only: [:crate, :destroy]

  def index
    @videos = Video.includes(:user).order('created_at DESC')
    @favorites = Favorite.includes(:user)
  end

  def create
    @favorite = Favorite.create(user_id: current_user.id, video_id: params[:video_id])
    #@favorites = Favorite.where(video_id: params[:video_id])
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, video_id: @video.id)
    @favorite.destroy
    @favorites = Favorite.where(video_id: params[:video_id])
    #@videos = Video.all
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def set_video
    @video = Video.find(params[:video_id])
 end
end
