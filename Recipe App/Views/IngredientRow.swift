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
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: "circle")
                .font(.caption)
                .offset(y: -1)
            VStack(alignment: .leading, spacing: 1){
                Text(ingredient.displayText)
                
                if let notes = ingredient.notes {
                    Text(notes)
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                        .padding(.leading, 15)
                }
            }
        }
    }
}

//#Preview {
//    IngredientRow()
//}
