class Public::PlansController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @plans = current_user.plans.all
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to plans_path
    else
      @plans = current_user.plans.all
      render :index
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path
    else
      render :edit
    end
  end

  def working
    plans = current_user.plans.all
    @plans = Plan.get_enable_plans(plans)
  end

  private

  def plan_params
    params.require(:plan).permit(:title)
  end
  
  def is_matching_login_user
    @plan = Plan.find(params[:id])
    @user = @plan.user
    redirect_to plans_path unless @user == current_user
  end
end
