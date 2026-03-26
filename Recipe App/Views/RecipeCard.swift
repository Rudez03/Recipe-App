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
        VStack (spacing: 8){
			Text(recipe.name)
                .font(.title)
			Text("prep-time: " + recipe.prepTime)
			Text(recipe.description)
		}
        .padding()
        //.foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.teal)
                .opacity(0.25)
            
    
        }
    }
}

#Preview {
	var recipe = Recipe(name: "Cookies")
	recipe.description = "Soft and chewy"
	recipe.prepTime = "20 min"
	return RecipeCard(recipe: recipe)
}
