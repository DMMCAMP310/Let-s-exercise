class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :trainings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_trainings, through: :likes, source: :training
  
  has_one_attached :profile_image
  enum gender: { man:false, woman:true }
  enum generation: { Z:0, Y:1, X:2 }
  validates :name, presence:true
  validates :introduction, presence:true
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
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
