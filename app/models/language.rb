class Language < ApplicationRecord
  has_many :speeches, foreign_key: "lahguage_id"
  has_many :users, through: :speeches, source: :user
end
