# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, except: :update

  def show
    @musics = @user.musics
    @favorite_musics = @user.favorite_musics
  end

  def edit
    if current_user != @user
      redirect_to root_path
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :profile, :image)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
