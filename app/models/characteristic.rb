class Characteristic < ApplicationRecord
  belongs_to :user
  belongs_to :ability
  
  Grades=['E', 'D', 'C', 'B', 'A', 'A+', 'A++']
end
