class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :trainings, dependent: :destroy
  has_one_attached :profile_image
  enum gender: { man:false, woman:true }
  enum generation: { Z:0, Y:1, X:2 }
  validates :name, presence:true
  validates :introduction, presence:true
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com', gender: 'man', age: '20', introduction: 'お試し') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
end
