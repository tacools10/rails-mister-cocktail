class DosesController < ApplicationController
  before_action :find_cocktail, only[:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.dose.build(dose_params)
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end


end
