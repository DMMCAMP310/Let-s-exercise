class Public::WeekEnablesController < ApplicationController
  def index
    @enables = current_user.enables.all
  end
  
  def show
    @plan = Plan.find(param[:id])
  end

  def update
    week_ids = params[:plan][:week_ids]
    
    week_ids.shift
    plan = Plan.find(params[:plan_id])
    plan.week_enables.each do |week_enable|
   
      if  week_ids.include?(week_enable.week.id.to_s)
        week_enable.update(checked: true)
      else
         week_enable.update(checked: false)
      end
    end
    
     redirect_to working_plans_path
  end

  def destroy
    @enable = Enable.find(params[:id])
    @enable.destroy
    @enable = Enable.all
    redirect_to enables_path
  end

  def create
    plan = Plan.find(params[:plan_id])
    Week.all.each do |week|
      plan.week_enables.create!(week_id: week.id)
    end
    
    redirect_to working_plans_path
  end

  private

  def enable_params
    params.require(:enable).permit(:plan_id)
  end
  
  def checkbox_params
    params.require(:enable).permit(:name, week_ids:[])
  end
end