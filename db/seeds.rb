# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

			Product.create!([
			{
				:title => "Cherry Apple Old Fashioned",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 24.99, 
				:permalink => "cherry_apple",
				:image => (File.open(File.join(Rails.root, "app/assets/images/cherryapple.jpg")))

			}
			])
			Product.create!([
			{
				:title => "Earl Gray Martini",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 24.99,
				:permalink => "earl_gray",
				:image => (File.open(File.join(Rails.root, "app/assets/images/earlgray.jpg")))

			}
			])
			Product.create!([
			{
				:title => "Ginger Jalepño Margarita",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 24.99,
				:permalink => "ginger_jalapeño",			
				:image => (File.open(File.join(Rails.root, "app/assets/images/gingerjala.jpg")))

			}
			])
