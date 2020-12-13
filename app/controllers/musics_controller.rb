# frozen_string_literal: true

class MusicsController < ApplicationController
  def index
    @musics = Music.includes(:user).order(created_at: :desc)
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    if @music.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @music = Music.find(params[:id])
    @comment = Comment.new
    @comments = @music.comments.includes(:user)
  end

  def edit
    @music = Music.find(params[:id])
    unless user_signed_in? && current_user.id == @music.user.id
      redirect_to action: :index
    end
  end

  def update
    @music = Music.find(params[:id])
    if @music.update(music_params)
      redirect_to music_path(@music.id)
    else
      render :edit
    end
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to root_path
  end

  def search
    @musics = Music.search(params[:keyword])
  end

  private
    def music_params
      params.require(:music).permit(:image, :file, :artist, :title).merge(user_id: current_user.id)
    end
end
