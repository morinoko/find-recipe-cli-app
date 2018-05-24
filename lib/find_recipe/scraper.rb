class FindRecipe::Scraper
	ROOT_URL = "https://cookpad.com"
	
	def self.scrape_trending_recipes_page
		recipes = []
		
		recipe_page = self.get_trending_recipes_page
		# binding.pry
		
		recipe_cards = recipe_page.css( ".card.feed__card" )
		recipe_cards.collect do |card|
				recipe = {
					recipe_name: card.css( "h2.recipe-title" ).text.strip,
					recipe_url: ROOT_URL + card.css( "a.link-unstyled" ).attribute( "href" ).value
				}
		end
		
	end
	
	def self.get_trending_recipes_page
		url = ROOT_URL + "/uk/trending"
		Nokogiri::HTML( open( url ) )
	end
end