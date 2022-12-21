class Public::MeritsController < ApplicationController
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
end
