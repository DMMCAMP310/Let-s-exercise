class Plan < ApplicationRecord
  belongs_to :user
  has_many :week_enables, dependent: :destroy
  has_many :weeks, :through => :week_enables
  validates :title, presence:true, length: {maximum: 60 }
  
  def plan_played
    if week_enables.size == 0
      Week.all.each do |week|
        week_enables.create(week_id: week.id)
      end
    end
  end
end
