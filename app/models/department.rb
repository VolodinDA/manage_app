class Department < ApplicationRecord
  belongs_to :assignment
  has_many :objectives
  default_scope->{ order('designation DESC') }
end
