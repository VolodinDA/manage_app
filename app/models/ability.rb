class Ability < ApplicationRecord
  has_many :characteristics, foreign_key: "ability_id"
  has_many :users, through: :characteristics, source: :user
end
