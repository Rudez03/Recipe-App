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
                Text(recipe.displayTime)
			}
            
			Text(recipe.descrip)
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
    let recipe = Recipe(name: "Cookies",
                        description: "Soft and chewy",
                        ingredients: [],
                        totalMins: 20
    )
    
	return RecipeCard(recipe: recipe)
}
