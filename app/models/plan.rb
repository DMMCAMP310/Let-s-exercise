class Plan < ApplicationRecord
  belongs_to :user
  has_many :enables, dependent: :destroy
  validates :title, length: {maximum: 60 }
end
