class MemesController < ApplicationController
  layout 'application'

  def index
    @memes = Meme.all.group_by { |meme| meme.created_at.to_date }
  end

  def by_popularity
    @memes = Meme.all.group_by { |meme| meme.votes_count }.sort.reverse
    render 'index'
  end


end
