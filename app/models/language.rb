class Language < ApplicationRecord
  has_many :speeches
  has_many :users, through: :speeches
end
