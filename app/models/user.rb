class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :memes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
