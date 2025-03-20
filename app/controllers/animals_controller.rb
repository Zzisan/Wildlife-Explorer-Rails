class AnimalsController < ApplicationController
  def index
    @classifications = Animal.select(:classification).distinct.order(:classification).pluck(:classification)

    @animals = Animal.all

    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @animals = @animals.where(
        "LOWER(common_name) LIKE ? OR LOWER(scientific_name) LIKE ?", 
        search_term, 
        search_term
      )
    end

    if params[:classification].present? && params[:classification] != "All"
      @animals = @animals.where(classification: params[:classification])
    end

    @animals = @animals.order(:common_name).page(params[:page]).per(10)
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
