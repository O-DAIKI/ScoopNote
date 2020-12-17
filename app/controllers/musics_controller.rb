# frozen_string_literal: true

class MusicsController < ApplicationController
  before_action :set_music, except: [:index, :new, :create,]

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
    @comment = Comment.new
    @comments = @music.comments.includes(:user)
  end

  def edit
    unless user_signed_in? && current_user.id == @music.user.id
      redirect_to action: :index
    end
  end

  def update
    if @music.update(music_params)
      redirect_to music_path(@music.id)
    else
      render :edit
    end
  end

  def destroy
    @music.destroy
    redirect_to root_path
  end

  def search
    @musics = Music.search(params[:keyword])
  end

  private
    def music_params
      params.require(:music).permit(:image, :file, :artist, :title).merge(user_id: current_user.id)
    end

    def set_music
      @music = Music.find(params[:id])
    end
end
