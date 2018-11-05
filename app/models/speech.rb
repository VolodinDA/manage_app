class Speech < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :language, required: false
end
