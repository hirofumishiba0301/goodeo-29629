class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:image, :name, :info, :category_id, :goodjob, :samnail, :views).merge(user_id: current_user.id)
  end

end
