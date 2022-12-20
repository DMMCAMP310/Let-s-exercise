class Public::PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
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
  
  private
  
  def plan_params
    params.require(:plan).permit(:title)
  end
end
