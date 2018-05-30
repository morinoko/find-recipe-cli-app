class FindRecipe::Recipe::TrendingRecipe < FindRecipe::Recipe
	
	@@all = []
	
	# Create recipes based off an array of recipe data hashes output by the scraper
	def self.create_recipes
		recipe_array = FindRecipe::Scraper.scrape_trending_recipes_page
		
		recipes = recipe_array.collect do |recipe|
			self.new( recipe )
		end
		
		# Add remaining attributes from each individual recipe page
		recipes.each do |recipe|
			additional_recipe_data = FindRecipe::Scraper.scrape_individual_recipe_data( recipe.url )
			recipe.add_additional_recipe_data( additional_recipe_data )
			@@all << recipe
		end
	end
	
	def self.all
		@@all
	end

end