class Enable < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :week_enables
  has_many :weeks, :through => :week_enables
end
