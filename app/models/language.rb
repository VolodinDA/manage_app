class Language < ApplicationRecord
  has_many :speeches, foreign_key: "language_id"
  has_many :users, through: :speeches, source: :user

  def self.learned_by(user)
    users_languages_ids=user.language_ids
    where("id IN (?)", users_languages_ids)
  end
end
