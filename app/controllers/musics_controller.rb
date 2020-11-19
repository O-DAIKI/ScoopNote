class MusicsController < ApplicationController

  def index
  end
  
  def new
  end
  
  private

  def music_params
    params.require(:music).permit(:image, :file, :artist, :title).merge(user_id: current_user.id)
  end
end
