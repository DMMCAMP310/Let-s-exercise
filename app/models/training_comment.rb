class TrainingComment < ApplicationRecord
  belongs_to :user
  belongs_to :training
  
  validates :comment, presence:true
end
