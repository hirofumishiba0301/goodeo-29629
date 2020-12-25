class ThumbnailsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_thumbnail, only: [:show, :edit, :update, :destroy]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.includes(:user).order('created_at DESC')
  end

  def new
    @thumbnail = Thumbnail.new
    #@video_thumbnail = VideoThumbnail.new
  end

  def create
    @thumbnail = Thumbnail.new(thumbnail_params)
    if @thumbnail.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to video_path unless @video.user_id == current_user.id
  end

  def update
    if @thumbnail.update(thumbnail_params)
      render :show
    else
      render :edit
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end


  def set_thumbnail
    @thumbnail = Thumbnail.find(params[:id])
  end


  def thumbnail_params
    params.require(:thumbnail).permit(:poster)
  end
end
