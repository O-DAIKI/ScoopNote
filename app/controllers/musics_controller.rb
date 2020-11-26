# frozen_string_literal: true

class MusicsController < ApplicationController
  def index
    @musics = Music.all
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
  end

  private
    def music_params
      params.require(:music).permit(:image, :file, :artist, :title).merge(user_id: current_user.id)
    end
end
