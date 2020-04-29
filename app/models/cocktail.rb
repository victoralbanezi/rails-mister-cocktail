class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  
  # average_rating: = self.avg
  # before_save :avg

   def avg
    self.average_rating = Review.where("cocktail_id = #{self.id}").sum(:rating) / Review.where("cocktail_id =#{self.id}").count
  end
end
