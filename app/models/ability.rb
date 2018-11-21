class Ability < ApplicationRecord
  has_many :characteristics, foreign_key: "ability_id"
  has_many :users, through: :characteristics, source: :user

  default_scope->{order('description ASC')}
  validates :description, presence: true
end
