# This Class acts as the CLI Controller
class FindRecipe::CLI
	
	def call
		search_options
	end
	
	def search_options
		puts ""
		puts "Welcome!".red
		puts "How do you want to get started?"
		puts ""
		puts "1.".blue + " See trending recipes"
		puts "2.".blue + " Search for a recipe"
		puts ""
		puts "Enter 1 or 2, or exit"
		
		input = gets.strip.downcase
		
		if input == "1"
			
			# Scrapes recipes only once to save loading time
			if !@trending_recipes
				puts "Please wait a moment for the recipes to be loaded..."
				@trending_recipes = FindRecipe::Recipe.create_recipes
			end
			trending_recipes
		elsif input == "2"
		
			# Scrape recipes only if a search hasn't been done yet or if user restarts
			if !@searched_recipes || @searched_recipes.length == 0
				puts "What is the dish or ingredient you want to search for?"
				input = gets.strip.downcase
				puts "Please wait a moment for the recipes to be loaded..."
				
				# If search keyword has spaces, it's necessary to replace them with %20 so the URL works
				@searched_recipes = FindRecipe::Recipe.create_recipes( input.gsub( " ", "%20" ) )
			end
			choose_searched_recipes
		elsif input == "exit"
		  exit_program
		else
			puts "Not sure what you mean..."
			search_options
		end
	end
	
	def trending_recipes
		puts "\n\n"
		@trending_recipes.each.with_index( 1 ) do |recipe, index|
			puts "#{index}.".green + " #{recipe.name}"
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
			exit_program
		end
	end
		
	def choose_searched_recipes
		puts "\n\n"
		puts "Search Results:".yellow
		puts ""
		@searched_recipes.each.with_index( 1 ) do |recipe, index|
			puts "#{index}.".green + " #{recipe.name}"
		end
		
		puts ""
		puts "Choose a recipe number or type 'restart'"
		
		input = gets.strip.downcase

		if input.to_i > 0 && input.to_i <= @searched_recipes.count
			@searched_recipes[ input.to_i - 1 ].get_details
		elsif input == "restart"
			@searched_recipes.clear
			search_options
		else
			puts "Not sure what you mean..."
			choose_searched_recipes
		end

		puts "Do you want to see the list again, restart, or exit?"
		puts "Enter list, restart, or exit"	
		input = gets.strip.downcase
		
		if input == "list"
			choose_searched_recipes
		elsif input == "restart"
			@searched_recipes.clear
			search_options
		elsif input == "exit"
			exit_program
		end
	end
	
	def exit_program
		puts "See you next time!"
		exit
	end
end
