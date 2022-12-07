class Admin::TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end
end
