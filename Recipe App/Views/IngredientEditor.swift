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
				ZStack {
					Capsule()
						.fill(Color.gray.opacity(0.2))
						.frame(height: 50)
						.padding(.leading)
						.padding(.trailing)
					TextField("Ingredient Name", text: $ingredient.name)
						.font(.title)
						.padding(.leading, 40)
				}
				.padding(.top,25)
				.padding(.bottom, 5)
				
				HStack{
					ZStack{
						Capsule()
							.fill(Color.gray.opacity(0.2))
							.frame(height: 40)
							.frame(width:300 )
							
						HStack{
							TextField("0", text: $ingredient.amount)
								.keyboardType(.numberPad)
								//.padding(.leading)
								.font(.title3)
								.frame(width: 60)
							
							Divider()
								.frame(height: 30)
								.frame(width: 50)
                            Picker("Unit", selection: $ingredient.unit) {
                                ForEach(IngredientUnit.allCases, id: \.self) { unit in
									Text(unit.displayName)
										.tag(unit)
                                
                                    
                                }
                            }
						}
						
						
						
					}
					//.frame(width: 150 )
					Spacer()
				}
				.padding(.leading)
				.padding(.trailing)
				.padding(.bottom)
				
				
				
				TextField("Add Notes", text: $ingredient.notes, axis: .vertical)
					.lineLimit(2...4)
					.font(.body)
					.multilineTextAlignment(.leading)
					.padding(.bottom, 20)
					.padding(.leading,20)
					.padding(.trailing,10)
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
