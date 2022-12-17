class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @trainings = Training.looks(params[:search], params[:word])
    end
  end
  
  def index
  end
  
end
