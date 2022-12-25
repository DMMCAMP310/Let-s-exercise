class Public::WeekEnablesController < ApplicationController
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

  def create
    plan = Plan.find(params[:plan_id])
    if plan.week_enables.size == 0
      Week.all.each do |week|
        plan.week_enables.create(week_id: week.id)
      end
    end
    
    redirect_to working_plans_path
  end
end