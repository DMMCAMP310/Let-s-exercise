class Plan < ApplicationRecord
  belongs_to :user
  has_many :week_enables, dependent: :destroy
  has_many :weeks, :through => :week_enables
  validates :title, presence:true, length: {maximum: 60 }

  def get_week_enable
    if week_enables.size == 0
      Week.all.each do |week|
        week_enables.create(week_id: week.id)
      end
    end
  end

  def self.get_enable_plans(plans)
    enable_plans = []
    plans.each do |plan|
      if plan.week_enables.size != 0
        enable_plans.push(plan)
      end
    end
    return enable_plans
  end
  
  def delete_enable_plan
    if week_enables.size != 0
      week_enables.destroy_all
    end
  end


end
