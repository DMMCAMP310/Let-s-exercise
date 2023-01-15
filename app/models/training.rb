class Training < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :training_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
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
    likes.exists?(user_id: user.id)
  end
  
  def create_notification_by(current_user)
    if user != current_user
      notification = current_user.active_notifications.new(
        training_id: id,
        visited_id: user_id,
        action: 'training_comment'
      )
      
      notification.save if notification.valid?
    end
  end
  
  
  def written_by?(current_user)
    user == current_user 
  end
  
  
  
end
