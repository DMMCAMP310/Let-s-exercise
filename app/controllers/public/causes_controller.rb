class Public::CausesController < ApplicationController
  def index
    @causes = Cause.all
    @cause = Cause.new
  end
  
  def create
    @cause = Cause.new(cause_params)
    if @cause.save
      redirect_to causes_path
    else
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
end
