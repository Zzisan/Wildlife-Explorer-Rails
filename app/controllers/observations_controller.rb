class ObservationsController < ApplicationController
  def index
    @observations = Observation.all.order(observed_at: :desc).page(params[:page]).per(10)
  end

  def show
    @observation = Observation.find(params[:id])
  end
end
