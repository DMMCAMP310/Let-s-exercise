class Public::EnablesController < ApplicationController
  def index
    @enables = current_user.enables.all
  end

  def update
    enable = Enable.find(params[:id])
    enable.update(checkbox_params)
    redirect_to enables_path
  end

  def destroy
    enable = Enable.find(params[:id])
    enable.destroy
    redirect_to enables_path
  end

  def create
    if plan = Enable.find_by(plan_id: params[:enable][:plan_id], user_id: current_user.id)
    else
      enable = Enable.new(enable_params)
      enable.user_id = current_user.id
      enable.save
    end
    redirect_to enables_path
  end

  private

  def enable_params
    params.require(:enable).permit(:plan_id)
  end
  
  def checkbox_params
    params.require(:enable).permit(:name, week_ids:[])
  end
end
