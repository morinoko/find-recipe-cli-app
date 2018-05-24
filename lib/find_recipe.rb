# Loads the needed files. This could be moved into a config/environment.rb file later?
require_relative "find_recipe/version"

module FindRecipe
end

require_relative "find_recipe/cli"
require_relative "find_recipe/recipe"