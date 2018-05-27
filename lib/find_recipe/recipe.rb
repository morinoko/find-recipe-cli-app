class FindRecipe::Recipe
	attr_accessor :name, :description, :ingredients, :steps, :url
	
	def initialize( recipe_hash )
		# Use scraper to get a hash of data for each recipe including the above attributes. Add attributes and values to the new recipe 
		recipe_hash.each do |attribute, value|
			self.send( ("#{attribute}=" ), value)
		end
	end
	
	# Create recipes based off an array of recipe data hashes output by the scraper
	def self.create_trending_recipes
		recipe_array = FindRecipe::Scraper.scrape_trending_recipes_page
		
		trending_recipes = recipe_array.collect do |recipe|
			self.new( recipe )
		end
		
		trending_recipes.each do |recipe|
			additional_recipe_data = FindRecipe::Scraper.scrape_individual_recipe_data( recipe.url )
			recipe.add_additional_recipe_data( additional_recipe_data )
		end
	end
	
	def add_additional_recipe_data( data_hash )
		data_hash.each do |attribute, value|
			self.send( ("#{attribute}="), value )
		end
		self
	end
	
	# Create recipes from a search page based on the input word 
	def self.get_recipes_from_keyword( keyword )
		
	end
	
	
end