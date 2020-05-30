class MemesController < ApplicationController
  layout 'application'

  def index
    @memes = Meme.all.group_by { |meme| meme.created_at.to_date }
  end

  def by_popularity
    @memes = Meme.all.group_by { |meme| meme.votes_count }.sort.reverse
    render 'index'
  end

  def create
    @memes = Meme.new(meme_params)
    # user_id = current_user.id
    # p '========================='
    # p @memes
    # p '========================='
    if @memes.save
      redirect_to meme_path(@memes)
    else
      render :new
    end
  end

  private

  def meme_params
    params.permit(:title, :meme_type, :url_source, :category)
  end
end
