class FindRecipe::Recipe
	attr_accessor :name, :description, :ingredients, :steps
	
	def initialize( recipe_hash )
		# Use scraper to get a hash of data for each recipe including the above attributes. Add attributes and values to the new recipe 
		recipe_hash.each do |attribute, value|
			self.send( ("#{attribute}=" ), value)
		end
	end
	
	# Create recipes based off an array of recipe data hashes output by the scraper
	def self.trending
		recipe_array = FindRecipe::Scraper.scrape_trending_recipes_page
		trending_recipes = recipe_array.collect do |recipe|
			self.new( recipe )
		end
		
		trending_recipes
	end
	
	# Create recipes from a search page based on the input word 
	def self.get_recipes_from_keyword( keyword )
		
	end
	
	
end