class FavoritesController < ApplicationController
  before_action :set_music
  before_action :authenticate_user!

  def create
    @favorite = Favorite.create(user_id: current_user.id, music_id: @music.id)
    redirect_to music_path(@music.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, music_id: @music.id)
    @favorite.destroy
    redirect_to music_path(@music.id)
  end

  private
  def set_music
    @music = Music.find(params[:music_id])
  end
end
