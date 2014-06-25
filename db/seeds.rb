# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
			Admin.create(:email => 'pjsulli2k@gmail.com', :password => 'shithead1', :password_confirmation => 'shithead1')
			Admin.create(:email => 'adam@tippedmixology.com', :password => 'Mineral25', :password_confirmation => "Mineral25")
			Product.create!([
			{
				:title => "Cherry Apple Old Fashioned",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 24.99, 
				:permalink => "cherry_apple",
				:weight => 16.00,
				:units => 1.00,
				:image => (File.open(File.join(Rails.root, "app/assets/images/cherryapple.jpg")))

			}
			])
			Product.create!([
			{
				:title => "Earl Gray Martini",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 24.99,
				:permalink => "earl_gray",
				:weight => 16.00,
				:units => 1.00,
				:image => (File.open(File.join(Rails.root, "app/assets/images/earlgray.jpg")))

			}
			])
			Product.create!([
			{
				:title => "Ginger Jalepeño Margarita",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 24.99,
				:permalink => "ginger_jalapeño",
				:weight => 16.00,
				:units => 1.00,
				:image => (File.open(File.join(Rails.root, "app/assets/images/gingerjala.jpg")))

			}
			])
			Product.create!([
			{
				:title => "Three Pack",
				:description => "It was November. Although it was not yet late, the sky was dark when I turned into Laundress Passage. Father had finished for the day, switched off the shop lights and closed the shutters; but so I would not come home to darkness he had left on the light over the stairs to the flat.",
				:price => 74.97,
				:permalink => "threepack",	
				:weight =>48.00,
				:units => 3.00,		
				:image => (File.open(File.join(Rails.root, "app/assets/images/cherryapple.jpg")))

			}
			])
			State.create(
						  [
							{name: 'AL'},
							{name: 'AK'},
							{name: 'AZ'},
							{name: 'AR'},
							{name: 'CA'},
							{name: 'CO'},
							{name: 'CT'},
							{name: 'DC'},
							{name: 'DE'},
							{name: 'FL'},
							{name: 'GA'},
							{name: 'HI'},
							{name: 'ID'},
							{name: 'IL'},
							{name: 'IN'},
							{name: 'IA'},
							{name: 'KS'},
							{name: 'KY'},
							{name: 'LA'},
							{name: 'ME'},
							{name: 'MD'},
							{name: 'MA'},
							{name: 'MI'},
							{name: 'MN'},
							{name: 'MS'},
							{name: 'MO'},
							{name: 'MT'},
							{name: 'NE'},
							{name: 'NV'},
							{name: 'NH'},
							{name: 'NJ'},
							{name: 'NM'},
							{name: 'NY'},
							{name: 'NC'},
							{name: 'ND'},
							{name: 'OH'},
							{name: 'OK'},
							{name: 'OR'},
							{name: 'PA'},
							{name: 'RI'},
							{name: 'SC'},
							{name: 'SD'},
							{name: 'TN'},
							{name: 'TX'},
							{name: 'UT'},
							{name: 'VT'},
							{name: 'VA'},
							{name: 'WA'},
							{name: 'WV'},
							{name: 'WI'},
							{name: 'WY'},
						]
						)
