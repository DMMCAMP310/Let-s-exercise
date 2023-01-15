class Chat < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :room
  validates :message, presence:true
end
