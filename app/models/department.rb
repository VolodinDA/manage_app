class Department < ApplicationRecord
  has_many :objectives, dependent: :destroy
  has_many :users
  
  default_scope->{ order('designation ASC') }
end
