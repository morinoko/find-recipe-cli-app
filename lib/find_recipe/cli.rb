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
			search_for_recipes
		elsif input == "exit"
		  exit
		else
			puts "Not sure what you mean..."
			search_options
		end

	end
	
	def trending_recipes
		puts "\n\n"
		@trending_recipes = FindRecipe::Recipe.create_recipes
		
		@trending_recipes.each.with_index( 1 ) do |recipe, index|
			puts "#{index}. #{recipe.name}"
		end
		
		puts ""
		puts "Choose a recipe number or type 'back'"
		
		input = gets.strip.downcase

		if input.to_i > 0 && input.to_i <= @trending_recipes.count
			@trending_recipes[ input.to_i - 1 ].get_details
		elsif input == "back"
			search_options
		else
		 puts "Not sure what you mean..."
		 puts ""
		 trending_recipes
		end
		
		puts "Do you want to see the list again, restart, or exit?"
		puts "Enter list, restart, or exit"	
		input = gets.strip.downcase
		
		if input == "list"
			trending_recipes
		elsif input == "restart"
			search_options
		elsif input == "exit"
			exit
		end

	end
		
	def search_for_recipes
		puts "What is the dish or ingredient you want to search for?"
		input = gets.strip.downcase
		
		# If search keyword has spaces, it's necessary to replace them with %20 so the URL works
		@searched_recipes = FindRecipe::Recipe.create_recipes( input.gsub( " ", "%20" ) )
		
		choose_from_search
		
		puts ""
		puts "Do you want to see the list again, restart, or exit?"
		puts "Enter list, restart, or exit"	
		input = gets.strip.downcase
		
		if input == "list"
			choose_from_search
		elsif input == "restart"
			search_options
		elsif input == "exit"
			exit
		end
		
	end
	
	def choose_from_search
		puts "Search Results:"
		@searched_recipes.each.with_index( 1 ) do |recipe, index|
			puts "#{index} #{recipe.name}"
		end
		
		puts ""
		puts "Choose a recipe number or type 'back'"
		
		input = gets.strip.downcase

		if input.to_i > 0 && input.to_i <= @searched_recipes.count
			@searched_recipes[ input.to_i - 1 ].get_details
		elsif input == "back"
			search_options
		else
		 puts "Not sure what you mean..."
		 puts ""
		 choose_from_search
		end
	end
	
	
	def exit
		puts "See you next time!"
	end
	
end
