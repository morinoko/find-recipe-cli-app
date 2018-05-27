# Specifications for the CLI Assessment

## Specs:
- [x] Have a CLI for interfacing with the application
The FindRecipe CLI app allows users to find recipes in two ways: Looking at a list of trending recipes or by seeing a list of recipes based on a user-input search word. The command line interface walks the user through the process by first asking them how they want to find a recipe, then displays a list of recipe titles accordingly. Users can choose a recipe from the list to view its details, including the ingredients and steps. After viewing a recipes, users can then choose to go back to the list if they want to see a different recipe, start over from the beginning, or exit the program.

The CLI logic is separated into its own class and within it, each search option is handled by a separate function. The CLI makes use of the Recipe class to create recipes based on how the user wants to search.

- [x] Pull data from an external source
FindRecipe uses Nokogiri and Open-URI to scrape recipe data from Cookpad's English website. If the user chooses to see trending recipes, the app gets the recipes from the Trending page. If they choose to search with a keyword, then the app uses a search page based on the keyword.


- [x] Implement both list and detail views
When the user chooses a search option, first, a numbered list of recipe titles is displayed. By choosing a number, the details of that recipes are shown including the description, ingredients, and cooking steps. 