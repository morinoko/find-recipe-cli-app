class FindRecipe::Recipe
	attr_accessor :name, :description, :ingredients, :steps, :url
	
	# Passes in data from scraper when recipe is created
	def initialize( recipe_hash )
		recipe_hash.each do |attribute, value|
			self.send( ("#{attribute}=" ), value)
		end
	end
	
	def add_additional_recipe_data
		additional_recipe_data = FindRecipe::Scraper.scrape_individual_recipe_data( self.url )
		
		additional_recipe_data.each do |attribute, value|
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