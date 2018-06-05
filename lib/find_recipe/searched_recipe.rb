class FindRecipe::Recipe::SearchedRecipe < FindRecipe::Recipe
	@@all = []
	
	# Create recipes based off an array of recipe data hashes output by the scraper
	def self.create_recipes(keyword)
		recipe_array = FindRecipe::Scraper.scrape_search_page(keyword)
		
		recipes = recipe_array.collect do |recipe|
			self.new(recipe)
		end
		
		# Add remaining attributes from each individual recipe page
		recipes.each do |recipe|
			recipe.add_additional_recipe_data
			@@all << recipe
		end
	end
	
	def self.all
		@@all
	end
	
	def self.reset
		@@all.clear
	end
end
