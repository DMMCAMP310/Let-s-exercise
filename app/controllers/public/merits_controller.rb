class Public::MeritsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
    @merits = current_user.merits.all
    @merit = Merit.new
  end
  
  def create
    @merit = Merit.new(merit_params)
    @merit.user_id = current_user.id
    if @merit.save
      redirect_to merits_path
    else
      @merits = current_user.merits.all
      render :index
    end
  end
  
  def edit
    @merit = Merit.find(params[:id])
  end
  
  def update
    @merit = Merit.find(params[:id])
    if @merit.update(merit_params)
      redirect_to merits_path
    else
      render :edit
    end
  end
  
  private
  
  def merit_params
    params.require(:merit).permit(:title)
  end
  
  def is_matching_login_user
    @merit = Merit.find(params[:id])
    @user = @merit.user
    redirect_to merits_path unless @user == current_user
  end
end
