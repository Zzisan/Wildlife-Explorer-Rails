class HabitatsController < ApplicationController
  def index
    @habitats = Habitat.order(:name).page(params[:page]).per(10)
  end

  def show
    @habitat = Habitat.find(params[:id])
  end
end
