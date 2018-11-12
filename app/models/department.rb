class Department < ApplicationRecord
  belongs_to :assignment
  has_many :objectives
end
