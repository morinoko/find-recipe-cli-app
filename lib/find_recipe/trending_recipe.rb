class FindRecipe::Recipe::TrendingRecipe < FindRecipe::Recipe
	@@all = []
	
	# Create recipes based off an array of recipe data hashes output by the scraper
	def self.create_recipes
		recipe_array = FindRecipe::Scraper.scrape_trending_recipes_page
		
		recipes = recipe_array.collect do |recipe|
			self.new(recipe)
		end
		
		recipes.each do |recipe|
			recipe.add_additional_recipe_data
			@@all << recipe
		end
	end
	
	def self.all
		@@all
	end
end
