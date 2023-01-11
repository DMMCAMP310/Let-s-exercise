class Public::PlansController < ApplicationController
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
    @plans = plan.enable_hoge
    @plans = []
    plans.each do |plan|
      if plan.week_enables.size != 0
        @plans.push(plan)
      end
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title)
  end
end
