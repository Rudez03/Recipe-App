//
//  RecipeCard.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 3/25/26.
//

import SwiftUI

struct RecipeCard: View {
	var recipe: Recipe
    var body: some View {
		VStack {
			Text(recipe.name)
			Text(recipe.prepTime)
			Text(recipe.description)
				.backgroundStyle(RoundedRectangle)
		}
    }
}

#Preview {
	var recipe = Recipe(name: "Cookies")
	recipe.description = "Soft and chewy"
	recipe.prepTime = "20 min"
	return RecipeCard(recipe: recipe)
}
