class Objective < ApplicationRecord
  belongs_to :department

  validates :description, presence: true, length: {maximum: 140, minimum: 10}
end
