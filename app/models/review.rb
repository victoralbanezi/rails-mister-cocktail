class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  after_create :update_cocktail_rating

  def update_cocktail_rating
    
  end

end
