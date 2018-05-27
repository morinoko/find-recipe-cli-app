# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'find_recipe/version'

Gem::Specification.new do |spec|
  spec.name          = "find_recipe"
  spec.version       = FindRecipe::VERSION
  spec.authors       = ["Felice Forby"]
  spec.email         = ["feliceforby@gmail.com"]

  spec.summary       = %q{This CLI app lets you find a recipe from a trending recipe list or with a search word.}
  spec.description   = %q{This CLI app lets you find a recipe from a trending recipe list or with a search word. Recipes are sourced from Cookpad's English recipe page. Have fun and eat well!}
  spec.homepage      = "https://github.com/morinoko/find-recipe-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"
  
end
