class Public::TrainingCommentsController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    comment = current_user.training_comments.new(training_comment_params)
    comment.training_id = @training.id
    comment.save
    @trainings = Training.find(params[:training_id])
  end
  
  def destroy
    @training = Training.find(params[:training_id])
    @training_comment = current_user.training_comments.find_by(training_id: @training.id)
    @training_comment.destroy
  end
  
  private
  
  def training_comment_params
    params.require(:training_comment).permit(:comment)
  end
end
