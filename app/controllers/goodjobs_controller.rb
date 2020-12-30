class GoodjobsController < ApplicationController
  before_action :set_video

  def create
    @goodjob = Goodjob.create(user_id: current_user.id, video_id: @video.id)
    @goodjobs = Goodjob.where(video_id: params[:video_id])
    @videos = Video.all
  end

  def destroy
    @goodjob = Goodjob.find_by(user_id: current_user.id, video_id: @video.id)
    @goodjob.destroy
    @goodjobs = Goodjob.where(video_id: params[:video_id])
    @videos = Video.all
  end

  def set_video
    @video = Video.find(params[:video_id])
 end
end
