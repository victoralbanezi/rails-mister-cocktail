class ReviewsController < ApplicationController

    def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @review = Review.new
    end


    def create
        @review = Review.new(review_params)
        @cocktail = Cocktail.find(params[:cocktail_id])
        @review.cocktail_id = @cocktail.id
        if @review.save
          redirect_to cocktail_path(@cocktail)
        else
        #   render :new
        end
    end


    private

    def review_params
      params.require(:review).permit(:content, :cocktail_id, :rating)
    end
end
