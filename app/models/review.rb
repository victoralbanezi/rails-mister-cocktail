class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

before_save :update_cocktail_rating

  def update_cocktail_rating
    puts "A"
    cocktail = Cocktail.find(self.cocktail_id)
    # puts cocktail
    # puts cocktail.name 
    # puts cocktail.id 
    # puts cocktail.average_rating
    # cocktail.average_rating = Review.where("cocktail_id = #{cocktail.id}").sum(:rating) / Review.where("cocktail_id =#{cocktail.id}").count
    # puts "cocktail.average... #{cocktail.average_rating}"
    cocktail.update_average
  end

end



#  Review.where("cocktail_id = 64").sum(:rating)
# Review.where("cocktail_id = 64").count