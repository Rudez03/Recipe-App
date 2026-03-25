//
//  RecipeBook.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI

struct RecipeBook: View {
    var body: some View {
        Text("Recipe Book")
            //.navigationTitle("Recipes")
            .font(.title)
            //.padding(.bottom, 20)
        VStack{
            List {
                Text("Concha Cupcakes")
                Text("Chocolate Chip Cookies")
                Text("Cookies")
            }
        }
    }
}

#Preview {
    NavigationStack {
           RecipeBook()
       }
}
