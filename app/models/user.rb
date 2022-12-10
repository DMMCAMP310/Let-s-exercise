class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :trainings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_trainings, through: :likes, source: :training
  has_many :training_comments, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  has_one_attached :profile_image
  enum gender: { man:false, woman:true }
  enum generation: { Z:0, Y:1, X:2 }
  validates :name, presence:true
  validates :introduction, presence:true
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  def self.looks(search, word)
    if search != ""
      User.where(["name LIKE?", "%#{word}%"])
    else
      User.all
    end
  end
  
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com', gender: 'man', age: '20', introduction: 'お試し') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設けています
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
