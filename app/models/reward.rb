class Reward < ApplicationRecord
  has_many :merits, foreign_key:"reward_id"
  has_many :users, through: :merits, source: :user
end
