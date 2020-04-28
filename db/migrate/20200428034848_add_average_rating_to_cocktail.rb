class AddAverageRatingToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :average_rating, :integer
  end
end
