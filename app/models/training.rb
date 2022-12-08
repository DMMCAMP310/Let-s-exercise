class Training < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  def self.looks(search, word)
    if search != ""
      Training.where(["name LIKE?", "%#{word}%"])
    else
      Training.all
    end
  end
  
  def liked_by?(user)
    likes.exists?(user_id:user.id)
  end
end
