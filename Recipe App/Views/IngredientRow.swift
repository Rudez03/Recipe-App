//
//  IngredientRow.swift
//  Recipe App
//
//  Created by Chacho on 7/8/26.
//

import SwiftUI

struct IngredientRow: View {
    
    let ingredient: Ingredient
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "circle")
                    .font(.caption)
                Text(ingredient.displayText)
            }
            if let notes = ingredient.notes {
                Text(" \(notes)")
                    .italic()
                    .font(.body)
            }
        }
    }
}

//#Preview {
//    IngredientRow()
//}
