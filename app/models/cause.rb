class Cause < ApplicationRecord
  validates :title, length: {maximum: 60 }
end
