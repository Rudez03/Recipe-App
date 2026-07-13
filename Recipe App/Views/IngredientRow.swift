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
        HStack(alignment: .top){
            Image(systemName: "circle")
                .font(.caption)
            VStack(alignment: .leading, spacing: 1){
                Text(ingredient.displayText)
                
                if let notes = ingredient.notes {
                    Text("\(notes)")
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
