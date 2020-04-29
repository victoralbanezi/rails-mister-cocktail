class CocktailsController < ApplicationController
  def index


    @cocktail = Cocktail.new




   if params[:search].nil?
    @cocktails = Cocktail.all
   else
    @cocktails = Cocktail.where('name LIKE ?', "%#{params[:search]}%")
   end

  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to root_path
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url, :search, :photo)
  end
end
