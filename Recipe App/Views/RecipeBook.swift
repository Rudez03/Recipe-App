//
//  RecipeBook.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI

struct RecipeBook: View {
    
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
        )
    ]
    var body: some View {
        // TODO: add navigation stack/bar
        //navigationTitle("Recipe Book")
        ScrollView {
            VStack(spacing: 15){
                ForEach(recipes) { recipe in
                    RecipeCard(recipe: recipe)
                }
            }
            .padding(.top, 100)
        }
     

    }
}

#Preview {
    RecipeBook()
}


//        Text("Recipe Book")
//            //.navigationTitle("Recipes")
//            .font(.title)
//            //.padding(.bottom, 20)
//        VStack{
//            List {
//                Text("Concha Cupcakes")
//                Text("Chocolate Chip Cookies")
//                Text("Cookies")
//            }
//        }
