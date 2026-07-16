//
//  NewRecipe.swift
//  Recipe App
//
//  Created by Chacho on 7/15/26.
//

import SwiftUI

struct NewRecipe: View {
    @State private var recipe = Recipe(name:"")
    var body: some View {
        VStack(alignment: .leading) {
            
            // MARK: - Header
            TextField("Recipe Name", text: $recipe.name, axis: .vertical)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 40)
                .padding(.bottom, 20)
                .padding(.leading)
                .padding(.trailing)
            
            // MARK: - Time and Servings
            HStack{
                
                Image(systemName: "clock")
                    .padding(.leading)
                TextField("time", text: $recipe.prepTime)
                
                Spacer()
                
                Image(systemName: "person.crop.circle")
                Picker("serving size", selection: $recipe.servings) {
                    Text("Not Set")
                        .tag(nil as Int?)
                    ForEach( 1...20, id: \.self) { number in
                        Text("\(number) servings")
                            .tag(Optional(number))
                            
                    }
                }
                .pickerStyle(.menu)
            }
            .padding(.bottom)
            
            // MARK: - Description
            TextField("Add Desciption", text: $recipe.description, axis: .vertical)
                .lineLimit(2...4)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
                .padding(.leading)
                .padding(.trailing,10)
            
            
            // MARK: - Ingredients
            Text("Ingredients")
                .font(.title3.bold())
                //.underline()
                .padding(.bottom, 5)
            
            
            ForEach(recipe.ingredients) { ingredient in
                IngredientRow(ingredient: ingredient)
            }
            
            
            // MARK: - Instructions
            Text("Instructions")
                .font(.title3.bold())
               // .underline()
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
}

#Preview {
    NewRecipe(
    )
}
