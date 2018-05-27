class FindRecipe::Recipe
	attr_accessor :name, :description, :ingredients, :steps, :url
	
	def initialize( recipe_hash )
		# Use scraper to get a hash of data for each recipe including the above attributes. Add attributes and values to the new recipe 
		recipe_hash.each do |attribute, value|
			self.send( ("#{attribute}=" ), value)
		end
	end
	
	# Create recipes based off an array of recipe data hashes output by the scraper
	def self.create_recipes( keyword = nil )
		if keyword
			recipe_array = FindRecipe::Scraper.scrape_search_page( keyword )
		else
			recipe_array = FindRecipe::Scraper.scrape_trending_recipes_page
		end
		
		recipes = recipe_array.collect do |recipe|
			self.new( recipe )
		end
		
		recipes.each do |recipe|
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
	
	def get_details
		puts "Details for #{@name}:"
		puts "Description:"
		puts @description
		puts "Ingredients:"
		@ingredients.each do |ingredient|
			puts ingredient
		end
		puts "Steps:"
		@steps.each.with_index( 1 ) do |step, step_number|
			puts "#{step_number}. #{step}"
		end
	end
	
	
end