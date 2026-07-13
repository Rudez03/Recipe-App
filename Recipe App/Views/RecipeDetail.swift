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
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    HStack{
                        Label(recipe.prepTime, systemImage: "clock")
                            .padding()
                        
                        if let servings = recipe.servings {
                            Text("\(servings) servings")
                        }
                        else {
                            Label("Serving Size", systemImage: "person.crop.circle")
                                .padding()
                        }
                        //Spacer()
                    }
                    .padding(.bottom)
                    
                    Text(recipe.description)
                        .font(.body)
                        .padding(.bottom)
                    
                    Text("Ingredients")
                        .font(.title3.bold())
                        .underline()
                        .padding(.bottom, 5)
                    
                    
                    ForEach(recipe.ingredients) { ingredient in
                        IngredientRow(ingredient: ingredient)
                    }
                    
                    Text("Instructions")
                        .font(.title3.bold())
                        .underline()
                        .padding(.top,5)
                        .padding(.bottom, 5)

                    // TODO: add message
                    Spacer()
                    
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
                                        Ingredient(name: "Flour", amount: "2", measurement: "cups", notes: "till soft peaks form due to the devlopment process"),
                                        Ingredient(name: "Eggs", amount: "3")
                                    ],
                                    prepTime: "20 min",
                                    
                                   )
                     
        )
    }
    
}
