class Department < ApplicationRecord
  has_many :objectives
  has_many :users
  default_scope->{ order('designation DESC') }

end
