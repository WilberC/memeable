class CategoriesController < ApplicationController
  def index
    @meme_by_category = Meme.all.group_by do |meme|
      Category.find(meme.category_id).name
    end
  end
end
