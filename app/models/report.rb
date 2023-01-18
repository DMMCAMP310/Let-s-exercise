class Report < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :reported, class_name: "User"
  
  has_one_attached :image
  validates :reason, presence:true
end
