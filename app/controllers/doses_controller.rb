class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      raise
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def dose_params
    params.require(:dose).permit(:name, :ingredient, :cocktail)
  end
end


# DosesController
#   GET new
#     assigns a new dose as @dose (FAILED - 1)
#   POST create
#     with valid params
#       creates a new Dose (FAILED - 2)
#       assigns a newly created dose as @dose (FAILED - 3)
#       redirects to the created dose (FAILED - 4)
#     with invalid params
#       assigns a newly created but unsaved dose as @dose
#       re-renders the 'new' template
#   DELETE destroy
#     deletes a Dose (FAILED - 5)
