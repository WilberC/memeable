class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :memes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  has_many :memes, foreign_key: :owner_id
  has_many :comments
  has_many :commented_memes, through: :comments, source: :meme
  has_many :votes
  has_many :voted_memes, through: :votes, source: :meme
end
