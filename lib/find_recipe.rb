# Loads the needed files. This could be moved into a config/environment.rb file later?
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "find_recipe/version"

module FindRecipe
end

require_relative "find_recipe/cli"
require_relative "find_recipe/recipe"
require_relative "find_recipe/scraper"