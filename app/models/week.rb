class Week < ApplicationRecord
  has_many :week_enables
  has_many :enables, :through => :week_enables
end
