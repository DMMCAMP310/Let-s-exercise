class Public::CausesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
    @causes = current_user.causes.all
    @cause = Cause.new
  end
  
  def create
    @cause = Cause.new(cause_params)
    @cause.user_id = current_user.id
    if @cause.save
      redirect_to causes_path
    else
      @causes = current_user.causes.all
      render :index
    end
  end

  def edit
    @cause = Cause.find(params[:id])
  end

  def update
    @cause = Cause.find(params[:id])
    if @cause.update(cause_params)
      redirect_to causes_path
    else
      render :edit
    end
  end

  private

  def cause_params
    params.require(:cause).permit(:title)
  end
  
  def is_matching_login_user
    @cause = Cause.find(params[:id])
    @user = @cause.user
    redirect_to causes_path unless @user == current_user
  end
end




