class VotesController < ApplicationController
  def create
    meme_id = params[:meme_id].to_i
    user_id = current_user.id
    vote = Vote.find_by(meme_id: meme_id, user_id: user_id)
    if vote
      vote.destroy
    else
      Vote.create(meme_id: meme_id, user_id: user_id)
    end
    redirect_to meme_url(meme_id)
  end
end
