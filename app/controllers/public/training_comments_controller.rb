class Public::TrainingCommentsController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    comment = current_user.training_comments.new(training_comment_params)
    comment.training_id = @training.id
    comment.save
    @training_comment = TrainingComment.new
    @training.create_notification_by(current_user)
    respond_to do |format|
    format.html { redirect_to request.referer }
    format.js
    end
  end
  
  def destroy
    @training = Training.find(params[:training_id])
    @training_comment = current_user.training_comments.find_by(training_id: @training.id)
    @training_comment.destroy
    @training_comment = TrainingComment.new
  end
  
  private
  
  def training_comment_params
    params.require(:training_comment).permit(:comment)
  end
end
