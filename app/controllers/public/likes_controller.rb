class Public::LikesController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    like = current_user.likes.new(training_id: @training.id)
    like.save
  end
  
  def destroy
    @training = Training.find(params[:training_id])
    like = current_user.likes.find_by(training_id: @training.id)
    like.destroy
  end
end
