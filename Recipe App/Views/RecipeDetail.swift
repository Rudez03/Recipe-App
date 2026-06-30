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
                                    ingredients: [],
                                    prepTime: "20 min"
                                   )
                     
        )
    }
    
}
