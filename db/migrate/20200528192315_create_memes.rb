class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :title, null: false
      t.string :meme_type
      t.string :url_source, null: false
      t.integer :votes_count, default: 0, null: false
      t.integer :comments_count, default: 0, null: false
      t.references :category, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: {to_table: 'users'}

      t.timestamps
    end
  end
end
