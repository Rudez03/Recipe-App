//
//  IngredientEditor.swift
//  Recipe App
//
//  Created by Chacho on 7/31/26.
//

import SwiftUI

struct IngredientEditor: View {
    @State private var ingredient = Ingredient(name:"")
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                
                    
            }
        }
        .navigationBarTitle("Editor Screen")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save"){
                        dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel"){
                        dismiss()
                }
                
                
            }
        }
    }
}
#Preview {
    NavigationStack {
        IngredientEditor()
    }
}
