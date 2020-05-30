class VotesController < ApplicationController
  def create
    puts '<----------------------------------------------------------------------->'
    puts params[:meme_id]
    puts current_user.id
    puts '<----------------------------------------------------------------------->'
    #Votes.create(meme_id: params[:meme_id],)
  end
end
