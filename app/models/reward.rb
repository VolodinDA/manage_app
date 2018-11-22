class Reward < ApplicationRecord
  has_many :merits, foreign_key:"reward_id", dependent: :destroy
  has_many :users, through: :merits, source: :user

  default_scope->{ order('title ASC') }
  validates :title, presence: true, uniqueness: true
end
