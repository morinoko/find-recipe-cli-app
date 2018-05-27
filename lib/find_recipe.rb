# Loads the needed files.
require 'open-uri'
require 'nokogiri'
require 'colorize'
# Uncomment below if you need to use pry for debugging, etc.
# require 'pry'

require_relative "find_recipe/version"

module FindRecipe
end

require_relative "find_recipe/cli"
require_relative "find_recipe/recipe"
require_relative "find_recipe/scraper"