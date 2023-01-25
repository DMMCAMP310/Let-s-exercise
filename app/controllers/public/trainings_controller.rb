class Public::TrainingsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @training = Training.new
  end

  def index
    @trainings = Training.page(params[:page]).per(5).order(created_at: :desc)
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    if @training.save
      redirect_to training_path(@training), notice: 'トレーニングを作成しました'
    else
      render 'new'
    end
  end

  def show
    @training = Training.find(params[:id])
    @training_comment = TrainingComment.new
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
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path
  end

  def likes
    likes = Like.where(user_id: current_user.id).pluck(:training_id)
    @trainings = Training.find(likes)
  end

  private

  def training_params
    params.require(:training).permit(:name, :introduction, :result, :food, :goal)
  end
  
  def is_matching_login_user
    @training = Training.find(params[:id])
    @user = @training.user
    redirect_to trainings_path unless @user == current_user
  end
end