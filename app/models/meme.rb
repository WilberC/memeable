class Meme < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User", counter_cache: true
  has_many :comments
  has_many :commentators, through: :comments, source: :user
  has_many :votes
  has_many :voters, through: :votes, source: :user
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url_source, presence: true, format: { with: /\A.+\.(?:png|jpg|gif)\z/i, message: "%{value} should be .png, .jpg or .gif"}
  validates :votes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :comments_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :meme_type, inclusion: { in: %w(image gif), message: "%{value} is not a valid meme type" }
end
