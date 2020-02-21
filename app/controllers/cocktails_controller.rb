class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    find_cocktail
    @ingredients = @cocktail.ingredients
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    find_cocktail
  end

  def update
    find_cocktail
    @cocktail.update!(params_cocktail)
    redirect cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
