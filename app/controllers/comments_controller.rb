class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to music_path(@comment.music)
    else
      @music = @comment.music
      @comments = @music.comments
      render "musics/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, music_id: params[:music_id])
  end
end
