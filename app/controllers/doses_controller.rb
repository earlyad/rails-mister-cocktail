class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :index]

   def new
     @review = Review.new
   end

   def create
     @review = Review.new(review_params)

     @review.cocktail = @cocktail
     @review.save

     redirect_to cocktail_reviews_path(@cocktail)
   end

   def index
     @reviews = @cocktail.reviews
   end


   private

   def review_params
     params.require(:review).permit(:content)
   end

   def set_cocktail
     @cocktail = Cocktail.find(params[:cocktail_id])
   end

end

