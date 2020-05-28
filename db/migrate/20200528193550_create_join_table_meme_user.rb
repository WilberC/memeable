class CreateJoinTableMemeUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :memes do |t|
      # t.index [:user_id, :meme_id]
      # t.index [:meme_id, :user_id]
    end
  end
end
