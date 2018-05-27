# This Class acts as the CLI Controller
class FindRecipe::CLI
	
	def call
		search_options
	end
	
	def search_options
		puts ""
		puts "How do you want to get started?"
		puts ""
		puts "1. See trending recipes"
		puts "2. Search for a recipe"
		puts ""
		puts "Enter 1 or 2, or exit"
		
		input = gets.strip.downcase
		
		if input == "1"
			trending_recipes
		elsif input == "2"
			search_recipe
		elsif input == "exit"
		  exit
		else
			puts "Not sure what you mean..."
			search_options
		end

	end
	
	def trending_recipes
		@trending_recipes = FindRecipe::Recipe.create_trending_recipes
		
		@trending_recipes.each.with_index( 1 ) do |recipe, index|
			puts "#{index}. #{recipe.name}"
		end
		
		puts ""
		puts "Choose a recipe number or type 'back'"
		
		input = gets.strip.downcase

		if input.to_i > 0 && input.to_i <= @trending_recipes.count
			get_recipe_from_number( input.to_i - 1 )
		elsif input == "back"
			search_options
		else
		 puts "Not sure what you mean..."
		 puts ""
		 trending_recipes
		end
		
		input = nil
		
		while input != "exit"
			puts "Do you want to see the list again, restart, or exit?"
			puts "Enter list, restart, or exit"	
			input = gets.strip.downcase
			
			if input == "list"
				trending_recipes
			elsif input == "restart"
				search_options
			end
		end
		
		exit
	end
	
	def get_recipe_from_number( number )
		recipe = @trending_recipes[ number ]
		puts "Details for #{recipe.name}:"
		puts "Description:"
		puts recipe.description
		puts "Ingredients:"
		recipe.ingredients.each do |ingredient|
			puts ingredient
		end
		puts "Steps:"
		recipe.steps.each.with_index( 1 ) do |step, step_number|
			puts "#{step_number} #{step}"
		end
	end
	
	def search_recipe
		puts "What is the dish or ingredient you want to search for?"
		
		input = gets.strip.downcase
		
		@search_recipes = FindRecipe::Recipe.get_recipes_from_keyword( input )
		puts "Results for #{input}:"
		@search_recipes.each.with_index( 1 ) do |recipe, index|
			puts "#{index} #{recipe.name}"
		end
		
		exit
	end
	
	def exit
		puts "See you next time!"
	end
	
end
