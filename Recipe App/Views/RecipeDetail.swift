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
            ScrollView {
                VStack(alignment: .leading){
                    HStack{
                        Label(recipe.prepTime, systemImage: "clock")
                            .padding()
                        
                        if let servings = recipe.servings {
                            Label(
                                    "\(servings) servings",
                                    systemImage: "person.crop.circle"
                                )
                            .padding(.leading, 80)
                        }
                        else {
                            Label("Serving Size", systemImage: "person.crop.circle")
                                .padding(.leading, 80)
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

                    if let instructions = recipe.instructions {
                        Text("\(instructions)")
                    }
                    else{
                        //will be a button!
                        Text("Add your instructions +")
                    }
                    Spacer()
                    
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
                                    servings: 10
                                   )
                     
        )
    }
    
}
