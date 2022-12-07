class Training < ApplicationRecord
  belongs_to :user
  
  def self.looks(search, word)
    if search != ""
      Training.where(["name LIKE?", "%#{word}%"])
    else
      Training.all
    end
  end
end
