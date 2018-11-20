class Department < ApplicationRecord
  has_many :objectives, dependent: :destroy
  has_many :users
  
  default_scope->{ order('designation ASC') }
  validates :designation, presence: true, uniqueness: true
end
