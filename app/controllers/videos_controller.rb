class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.includes(:user).order('created_at DESC')
  end

  def new
    @video = Video.new
    #@video_thumbnail = VideoThumbnail.new
  end

  def create
  @video = Video.new(video_params)
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def edit
    redirect_to video_path unless @video.user_id == current_user.id
  end

  def update
    if @video.update(video_params)
      render :show
    else
      render :edit
    end
  end



    #@video_thumbnail = VideoThumbnail.new(video_thumbnail_params)
    #if @video_thumbnail.valid?
     # @video_thumbnail.save
      #redirect_to root_path
    #else
     # render :new
    #end
  #end

  private

  def set_video
    @video = Video.find(params[:id])
  end


  def video_params
    params.require(:video).permit(:movie, :name, :info, :category_id, :goodjob, :views).merge(user_id: current_user.id)
  end
  #def video_thumbnail_params
   # params.require(:video_thumbnail).permit(:movie, :name, :info, :category_id, :goodjob, :poster, :views).merge(user_id: current_user.id)
  #end

end
