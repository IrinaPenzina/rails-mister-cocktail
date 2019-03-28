class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  def show
    set_dose
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def edit
    set_dose
  end

  def update
    set_dose
    @dose.update(dose_params)
    redirect_to cocktail_path
  end

  def destroy
    set_dose
    @dose.destroy
    redirect_to cocktail_path
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
