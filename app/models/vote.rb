class Vote < ApplicationRecord
  belongs_to :meme, counter_cache: true
  belongs_to :user
end
