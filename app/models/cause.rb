class Cause < ApplicationRecord
  belongs_to :user
  validates :title, presence:true, length: {maximum: 60 }
end
