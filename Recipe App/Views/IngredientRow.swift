//
//  IngredientRow.swift
//  Recipe App
//
//  Created by Chacho on 7/8/26.
//

import SwiftUI

struct IngredientRow: View {
    
    let displayText: String
    let notes: String
    
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: "circle.fill")
                .font(.caption2)
                .offset(y: -1)
            VStack(alignment: .leading, spacing: 1){
                Text(displayText)
                
                if notes != "" {
					Text(notes)
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                        .padding(.leading, 15)
						.padding(.bottom,5)
                }
				else{
					Spacer()
				}
            }
        }
    }
}

#Preview {
    let ingredient = Ingredient(
        name: "Flour",
        amount: "2",
        unit: .cups,
        notes: "Sifted"
    )

    IngredientRow(displayText: ingredient.displayText,
                  notes: ingredient.notes)
}
