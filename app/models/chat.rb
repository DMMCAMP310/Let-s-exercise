class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :message, length: {maximum: 50 }
end
