# CLI Controller
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
		
		input = nil 
		
		puts "Enter 1 or 2, or exit"
		input = gets.strip.downcase

		if input == "1"
			trending_recipes
		elsif input == "2"
			search_recipe
		end
	end
	
	def trending_recipes
		puts "1. Khaman dhokla"
		puts "2. Low carb Courgette fritters"
		puts "3. Bacon, Leek and Potato Soup"
		puts ""
		
		puts "Choose a recipe number or type 'back'"
		
		input = gets.strip.downcase

		if input.to_i > 0 && input.to_i <= 3
			get_recipe_from_number( input.to_i )
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
			elsif input == "exit"
				exit
			end
		end
	end
	
	def get_recipe_from_number(number)
		puts "Recipe #{number}"
	end
	
	def search_recipe
		puts "What is the dish or ingredient you want to search for?"
		
		input = gets.strip.downcase
		
		puts "#{input} Recipes:"
	end
	
	def exit
		puts "See you next time!"
	end
	
end
