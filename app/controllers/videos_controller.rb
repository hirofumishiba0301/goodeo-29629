class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :search_video, only: [:index, :search]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.includes(:user).order('created_at DESC')
    set_video_column   # 検索条件にマッチした動画の情報を取得
    @categories = Category.all
    @tags = Video.tag_counts_on(:tags).order('count DESC')
    if @tag = params[:tag]   # タグ検索用
      @video = Video.tagged_with(params[:tag])   # タグに紐付く投稿
    end
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

  def show
    @tags = @video.tag_counts_on(:tags)
  end

  def destroy
    if @video.user_id == current_user.id
      @video.destroy
      redirect_to root_path
    else
      redirect_to video_path
    end
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

  def search
    @results = @q.result.includes(:user)  # 検索条件にマッチした動画の情報を取得
  end

  private

  def search_video
    @q = Video.ransack(params[:q])
  end

  def set_video_column
    @video_name = Video.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:movie, :name, :info, :category_id, :goodjobs_count, :views, :tag_list).merge(user_id: current_user.id)
  end
end
