class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    set_cocktail
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def edit
    set_cocktail
  end

  def update
    set_cocktail
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
