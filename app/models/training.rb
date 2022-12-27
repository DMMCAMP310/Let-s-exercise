class Training < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :training_comments, dependent: :destroy
  
  validates :name, presence:true, length: {maximum: 20 }
  validates :goal, presence:true, length: {maximum: 20 }
  validates :introduction, presence:true
  
  def self.looks(search, word)
    if search != ""
      Training.where(["name LIKE(?) OR introduction LIKE(?) OR goal LIKE(?)","%#{word}%", "%#{word}%", "%#{word}%"])
    else
      Training.all
    end
  end
  
  def liked_by?(user)
    likes.exists?(user_id:user.id)
  end
end
