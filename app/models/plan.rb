class Plan < ApplicationRecord
  belongs_to :user
  has_many :week_enables, dependent: :destroy
  has_many :weeks, :through => :week_enables
  validates :title, length: {maximum: 60 }
end
