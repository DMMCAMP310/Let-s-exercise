class Week < ApplicationRecord
  has_many :week_enables
  has_many :plans, :through => :week_enables
end
