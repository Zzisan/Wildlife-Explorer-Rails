class AnimalsController < ApplicationController
  def index
    @animals = if params[:search].present?
                 Animal.where("common_name ILIKE ? OR scientific_name ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
               else
                 Animal.all
               end.order(:common_name).page(params[:page]).per(10)
  end
  

  def show
    @animal = Animal.find(params[:id])
  end
end
