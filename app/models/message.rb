class Message < ApplicationRecord
  belongs_to :user
  belogns_to :room
end
