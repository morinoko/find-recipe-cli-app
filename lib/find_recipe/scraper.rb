class FindRecipe::Scraper
	
	def self.scrape_trending_recipes_page
		recipe_page = get_trending_recipe_page
		
	end
	
	def self.get_trending_recipe_page
		Nokogiri::HTML( open( "https://cookpad.com/uk/trending" ) )
	end
end