class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  
  before_create  :set_defaults
  # before_save :update_average
  # average_rating: = self.avg
  # before_save :avg

   def update_average
    puts "salvando cocktail"
    puts self.name
    self.average_rating = Review.where("cocktail_id = #{self.id}").sum(:rating) / (Review.where("cocktail_id =#{self.id}").count+1)
    puts self.average_rating
    self.save
  end



  def set_defaults
    puts "set default"

    self.average_rating ||= 0
    # self.bool_field = true if self.bool_field.nil?
  end

end
