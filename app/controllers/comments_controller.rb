class CommentsController < ApplicationController
  def create
    meme_id = params[:meme_id].to_i
    user_id = current_user.id
    puts comment_params
    Comment.create(meme_id: meme_id, user_id: user_id,body: comment_params)
    redirect_to meme_url(meme_id)
  end

  private
  def comment_params
    params.require(:body)
  end
end
