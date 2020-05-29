class Meme < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User", counter_cache: true
  has_many :comments
  has_many :commentators, through: :comments, source: :user
  has_many :votes
  has_many :voters, through: :votes, source: :user
  
  validates :votes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :comments_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
