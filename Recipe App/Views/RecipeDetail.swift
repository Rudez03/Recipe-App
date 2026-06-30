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
           // Spacer()
            
            Text("Ingredients")
                .font(.title3.bold())
            ForEach(recipe.ingredients) { ingredient in
                HStack{
                    Text(ingredient.amount)
                    Text(ingredient.unit)
                    Text(ingredient.name)
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
                                    ingredients: [Ingredients(name: "Flour", amount: "2", unit: "cups"),
                                        Ingredients(name: "Eggs", amount: "3", unit: "none")],
                                    prepTime: "20 min"
                                   )
                     
        )
    }
    
}
