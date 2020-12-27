class GoodjobsController < ApplicationController
  def create
    @goodjob = Goodjob.create(user_id: current_user.id, video_id: params[:video_id])
    @goodjob = Goodjob.where(video_id: params[:video_id])
    @video = Video.all
  end

  def destoroy
    goodjob = Goodjob.find_by(user_id: current_user.id, video_id: params[:video_id])
    goodjob.destroy
    @goodjob = Goodjob.where(video_id: params[:video_id])
    @video = Video.all
  end
end
