class Assignment < ApplicationRecord
  has_one :user
  has_one :department
end
