class Admin::TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end
  
  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to admin_trainings_path
  end
end
