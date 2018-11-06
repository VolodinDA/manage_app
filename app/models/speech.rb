class Speech < ApplicationRecord
  belongs_to :user
  belongs_to :language

  accepts_nested_attributes_for :language
end
