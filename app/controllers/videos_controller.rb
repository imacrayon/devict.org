class VideosController < ApplicationController
  def index
    @videos = Video.order("published_at DESC, title").page(params[:page]).per(8)
  end

  def show
    @video = Video.find(params[:id])
  end
end
