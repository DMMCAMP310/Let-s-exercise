class Public::TrainingsController < ApplicationController
  def new
    @training = Training.new
  end
  
  def index
    @trainings = Training.all
    @training = Training.new
  end
  
  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    if @training.save
      redirect_to training_path(@training), notice: 'トレーニングを作成しました'
    else
      @trainings = Training.all
      render 'index'
    end
  end
  
  def show
    @training = Training.find(params[:id])
  end
  
  def edit
    @training = Training.find(params[:id])
  end
  
  def update
    @training = Training.find(params[:id])
    if @training.update(training_params)
      redirect_to training_path(@training.id), notice: 'トレーニングを編集しました'
    else
      render 'edit'
    end
  end
  
  def destroy
    
  end
  
  private
  
  def training_params
    params.require(:training).permit(:name, :introduction, :result, :food, :goal)
  end
end