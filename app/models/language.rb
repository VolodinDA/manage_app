class Language < ApplicationRecord
  has_many :speeches, foreign_key: "language_id"
  has_many :users, through: :speeches, source: :user
end
