//
//  RecipeBook.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI

struct RecipeBook: View {
    
    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var recipesShown: [Recipe]  {
        if searchText.isEmpty {
            return recipes
        }
        else {
            return recipes.filter { recipe in
                recipe.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    let recipes: [Recipe] = [
        Recipe(name: "Cookies",
               description: "Soft and chewy",
               ingredients: [],
               prepTime: "20 mins"
        ),
        
        Recipe(name: "Concha Cupcakes",
               description: "Sweet and cute",
               ingredients: [],
               prepTime: "45 mins"
        ),
        
        Recipe(name: "Strawberry Cheesecake",
               description: "Refreshing and Sweet",
               ingredients: [],
               prepTime: "15 mins"
        ),
        
        Recipe(name: "Churro Cheesecake",
               description: "Warm yet nastolgic",
               ingredients: [],
               prepTime: "1:30 hrs"
        ),
        
        Recipe(name: "Macaroons",
               description: "Delicous and cute",
               ingredients: [],
               prepTime: "2 hrs"
        ),
        
    ]
    var body: some View {
        // TODO: add navigation stack/bar
        //navigationTitle("Recipe Book")
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(recipesShown) { recipe in
                        NavigationLink {
                            RecipeDetail(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                                .foregroundColor(.black)
                                
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 30)
                .padding(.horizontal)
            }
            .navigationTitle("Recipe Book")
            .searchable(text: $searchText, placement: .navigationBarDrawer)

        }
     

    }
}

#Preview {
    RecipeBook()
}
