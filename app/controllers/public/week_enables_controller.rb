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
    plan.get_week_enable

    redirect_to working_plans_path
  end

  def update_all
    plans = current_user.plans
    plans.each do |plan|
      plan.week_enables.each do |week_enable|
        week_enable.update(checked: false)
      end
    end
    redirect_to working_plans_path
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    plan.delete_enable_plan
      # if plan.week_enables.size != 0
      #     plan.week_enables.destroy_all
      # end
    redirect_to working_plans_path
  end

  def destroy_all
    plans = current_user.plans.all
    plans.each do |plan|
      if plan.week_enables.size != 0
          plan.week_enables.destroy_all
      end
    end
    redirect_to working_plans_path
  end
end