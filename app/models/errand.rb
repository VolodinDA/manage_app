class Errand < ApplicationRecord
  has_many :users

  default_scope-> { order('address ASC') }
  validates :address, presence: true
end
