class AnimalsController < ApplicationController
  def index
    @classifications = Animal.select(:classification).distinct.order(:classification).pluck(:classification)

    @animals = Animal.all

    if params[:search].present?
      @animals = @animals.where("common_name ILIKE ? OR scientific_name ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:classification].present?
      @animals = @animals.where(classification: params[:classification])
    end

    @animals = @animals.order(:common_name).page(params[:page]).per(10)
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
