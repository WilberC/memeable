class CreateJoinTableMemeTag < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tags, :memes do |t|
      # t.index [:tag_id, :meme_id]
      # t.index [:meme_id, :tag_id]
    end
  end
end
