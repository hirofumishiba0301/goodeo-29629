class ThumbnailsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_thumbnail, only: [:show, :edit, :update, :destroy]
  before_action :set_video, only: [:new, :show, :edit, :update, :destroy, :create]

  def index
    @videos = Video.includes(:user).order('created_at DESC')
  end

  def new
    redirect_to root_path unless @video.user_id == current_user.id
    redirect_to root_path unless @video.thumbnail.blank?
    @thumbnail = Thumbnail.new
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
    set_thumbnail
  end

  def update
    set_thumbnail
    binding.pry
    if @thumbnail.update(thumbnail_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @video.user_id == current_user.id
      @thumbnail.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def set_video
    @video = Video.find(params[:video_id])
  end


  def set_thumbnail
    @thumbnail = @video.thumbnail
  end


  def thumbnail_params
    params.require(:thumbnail).permit(:name, :poster).merge(video_id: params[:video_id])
  end
end
