# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @musics = @user.musics
    @favorite_musics = @user.favorite_musics
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :profile)
    end
end
