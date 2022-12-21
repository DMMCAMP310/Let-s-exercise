class Merit < ApplicationRecord
  belongs_to :user
  validates :title, length: {maximum: 60 }
end