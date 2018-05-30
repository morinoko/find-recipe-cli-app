class FindRecipe::Recipe
	attr_accessor :name, :description, :ingredients, :steps, :url
	
	# Passes in data from scraper when recipe is created
	def initialize( recipe_hash )
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
		
		# Add remaining attributes from each individual recipe page
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
		puts "\n\n"
		puts "Details for #{@name}:"
		puts "\n\n"
		puts "Description:".green
		puts @description
		puts "\n\n"
		puts "Ingredients:".green
		@ingredients.each do |ingredient|
			puts ingredient
		end
		puts "\n\n"
		puts "Steps:".green
		@steps.each.with_index( 1 ) do |step, step_number|
			puts "#{step_number}.".blue + " #{step}"
		end
		puts "\n\n"
	end
end