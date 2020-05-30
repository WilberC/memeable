class MemesController < ApplicationController
  layout 'application'

  def index
    @memes = Meme.all.group_by { |meme| meme.created_at.to_date }
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def by_popularity
    @memes = Meme.all.group_by { |meme| meme.votes_count }.sort.reverse
    render 'index'
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.owner = current_user
    if @meme.save
      redirect_to meme_url(@meme)
    else
      render :new
    end
  end

  private
  def meme_params
    params.require(:meme).permit(:title, :meme_type, :url_source, :category_id)
  end
end
