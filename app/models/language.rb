class Language < ApplicationRecord
  has_many :speeches, foreign_key: "language_id"
  has_many :users, through: :speeches, source: :user

  default_scope->{ order('name ASC')}
  validates :name, presence: true, uniqueness: true
end
