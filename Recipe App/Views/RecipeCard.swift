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
                .multilineTextAlignment(.center)
            
            
			HStack {
				Image(systemName: "clock")
                Text(recipe.prepTime)
			}
            
			Text(recipe.description)
                .multilineTextAlignment(.center)
		}
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.teal)
                .opacity(0.25)
            
    
        }
    }
}

#Preview {
    var recipe = Recipe(name: "Cookies",
                        description: "Soft and chewy",
                        ingredients: [],
                        prepTime: "20 min"
    )
    
	return RecipeCard(recipe: recipe)
}
