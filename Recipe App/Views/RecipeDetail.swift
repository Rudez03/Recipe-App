//
//  RecipeDetail.swift
//  Recipe App
//
//  Created by Chacho on 6/3/26.
//

import SwiftUI

struct RecipeDetail: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Label(recipe.prepTime, systemImage: "clock")
                    .padding()
                  
                
                Label("Serving Size", systemImage: "person.crop.circle")
                    .padding()
                   
                //Spacer()
            }
            .padding(.bottom)
            
            Text(recipe.description)
                .font(.body)
                .padding(.bottom)
            
            Text("Ingredients")
                .font(.title3.bold())
            ForEach(recipe.ingredients) { ingredient in
                HStack{
                    Text(ingredient.displayText)
                }
            }
            
            
            Spacer()
        }
        
        .padding()
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        RecipeDetail(recipe: Recipe(name: "Cookies",
                                    description: "Soft and chewy",
                                    ingredients: [
                                        Ingredient(name: "Flour", amount: "2", measurement: "cups"),
                                        Ingredient(name: "Eggs", amount: "3")
                                    ],
                                    prepTime: "20 min"
                                   )
                     
        )
    }
    
}
