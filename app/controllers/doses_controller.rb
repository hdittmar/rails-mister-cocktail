class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    p @cocktail
    @dose = Dose.new
    p @dose
  end

  def create
    @dose = Dose.create(params_dose)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    c = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(c)
  end

  private

  def params_dose
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def get_dose
    @dose = Dose.find(params[:id])
  end

end
