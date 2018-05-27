class FindRecipe::Scraper
	ROOT_URL = "https://cookpad.com"
	
	def self.scrape_trending_recipes_page
		recipes = []
		
		recipe_page = self.get_trending_recipes_page
		
		recipe_cards = recipe_page.css( ".card.feed__card" )
		recipe_cards.collect do |card|
				recipe = {
					recipe_name: card.css( "h2.recipe-title" ).text.strip,
					recipe_url: ROOT_URL + card.css( "a.link-unstyled" ).attribute( "href" ).value
				}
		end
	end
	
	def self.scrape_individual_recipe_data( recipe_url )
		recipe_data = {}

		recipe_page = self.get_individual_recipe_page( recipe_url )
		recipe_data[:description] = recipe_page.at("meta[itemprop='description']")['content']
		
		# Gets ingredients as an array of each ingredient
		recipe_data[:ingredients] = recipe_page.css( ".ingredient__details" ).collect{ |ingredient| ingredient.text.strip }
		
		# Gets steps as an array of each step
		recipe_data[:steps] = recipe_page.css(".step .prose").collect{ |step| step.text.strip }

		recipe_data
	end
	
	def self.get_trending_recipes_page
		url = ROOT_URL + "/uk/trending"
		Nokogiri::HTML( open( url ) )
	end
	
	def self.get_individual_recipe_page( recipe_url )
		Nokogiri::HTML( open( recipe_url ))
	end
end