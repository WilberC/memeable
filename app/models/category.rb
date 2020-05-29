class Category < ApplicationRecord
    has_many :memes
    validates :name, presence: true
    validates :name, uniqueness: true
end
