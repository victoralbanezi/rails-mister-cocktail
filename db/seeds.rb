require "open-uri"
names = ["Nasty Nectar","Lemonade Coffee","Garlic Eye","Kiwi Tea","Pure Six","Burning Wink","Mead Amigo","Unlucky Smooch","Wonderful Kisses","Lime Velour","Precious Blossom","Lavender Horror","Angelic Special","Lucky Squeeze","Red Plus","Flaming Six","Grapefruit Cooler","Almond Lord","Red Wine Heaven","Fallen Snowball","Tea Smash","Lemon Special","Summer Squeeze","Watermelon Tea","Almond Stardust","Rose Petal Hopper","Crimson White Win","Insanity Gloom","Sherry Shrub","Warm Riddle","Amazing Blood","Arctic Red Wine","Dark Ale Riddle","Pear Ball","Coriander Bomb","Demonic Stardust","Sugary Dark Beer","Jasmine Shadow","First Lord","Basil Crash","Tropical Bolt","Wine Tickle","Whiskey Touch","Steamy Flash","Wasabi Tonic","Rough Fluff","Vanillabean Major","Mead Smash","High Tremor","Black Brandy","Lemon Caipirinha","Strawberry Caipirinha","Mango Caipirinha","Pineapple Caipirinha","Vodka Caipirinha","Cachaça Caipirinha","Grape Caipirinha","Kiwi Caipirinha"]
ingredients_names = ["Light rum","Applejack","Gin","Dark rum","Sweet Vermouth","Strawberry schnapps","Scotch","Apricot brandy","Triple sec","Southern Comfort","Orange bitters","Brandy","Lemon vodka","Blended whiskey","Dry Vermouth","Amaretto","Tea","Champagne","Coffee liqueur","Bourbon","Tequila","Vodka","Añejo rum","Bitters","Sugar","Kahlua","demerara Sugar","Dubonnet Rouge","Lime juice","Irish whiskey","Apple brandy","Carbonated water","Cherry brandy","Creme de Cacao","Grenadine","Port","Coffee brandy","Red wine","Rum","Grapefruit juice","Ricard","Sherry","Cognac","Sloe gin","Apple juice","Pineapple juice","Lemon juice","Sugar syrup","Milk","Strawberries","Chocolate syrup","Yoghurt","Mango","Ginger","Lime","Cantaloupe","Berries","Grapes","Kiwi","Tomato juice","Cocoa powder","Chocolate","Heavy cream","Galliano","Peach Vodka","Ouzo","Coffee","Spiced rum","Water","Espresso","Angelica root","Orange","Cranberries","Johnnie Walker","Apple cider","Everclear","Cranberry juice","Egg yolk","Egg","Grape juice","Peach nectar","Lemon","Firewater","Lemonade","Lager","Whiskey","Absolut Citron","Pisco","Irish cream","Ale","Chocolate liqueur","Midori melon liqueur","Sambuca","Cider","Sprite","7-Up","Blackberry brandy","Peppermint schnapps","Creme de Cassis","Jack Daniels"]


ingredients_names.each do |ingredient_name|
    Ingredient.create(name: ingredient_name)
end

names.each do |name|
    file = URI.open("https://source.unsplash.com/collection/962396/#{rand(1..280)}")
    cocktail = Cocktail.new(name: name)
    cocktail.photo.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
    cocktail.save
    sleep(2)
    puts "created #{cocktail.id}"
end


puts "Creating doses"
400.times do
seed = Dose.create(cocktail_id: rand(1..59), ingredient_id: rand(1..100), description: "#{["50","100","150","200","300","400","500"].sample}ml")
puts seed.id
end
puts "Doses created"

puts "creating reviews"

500.times do
    review = Review.create(content: ["Good", "Bad", "Very Good", "Delicious", "Disgusting"].sample, cocktail_id: rand(1..59), rating: rand(1..5))
    puts review.id
end
puts "Reviews created"

