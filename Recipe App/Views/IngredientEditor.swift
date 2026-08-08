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
    
	
	//MARK: - Saving function/validation
    var onSave: (Ingredient) -> Void
	private var canSave: Bool {
		!ingredient.name
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.isEmpty
	}
	
	//MARK: - Keyboard Focus cases
	enum Field {
		case name
		case amount
	}
	@FocusState private var focusedField: Field?
	@FocusState private var isFocused: Bool
	
	
	
	
    var body: some View {
        ScrollView {
			VStack {
				ZStack {
					// MARK: - Ingredient Name
					Capsule()
						.fill(Color.gray.opacity(0.2))
						.frame(height: 50)
						.padding(.leading)
						.padding(.trailing)
					TextField("Ingredient Name", text: $ingredient.name)
						.font(.title)
						.padding(.leading, 40)
						.focused($focusedField, equals: .name)
						.submitLabel(.next)
						.onSubmit {
							focusedField = .amount
						}
				}
				.padding(.top,25)
				.padding(.bottom, 5)
				
				
				//MARK: - Amount/Unit
				HStack{
					ZStack{
						Capsule()
							.fill(Color.gray.opacity(0.2))
							.frame(height: 40)
							.frame(width:300 )
							
						HStack{
							// Amount
							TextField("0", text: $ingredient.amount)
								.font(.title3)
								.frame(width: 60)
								.focused($focusedField, equals: .amount)
									.submitLabel(.done)
									.onSubmit {
										focusedField = nil
									}
							
							Divider()
								.frame(height: 30)
								.frame(width: 50)
							
							// Unit picker
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
				
				
				// MARK: - Notes Optional
				TextField("Add Notes", text: $ingredient.notes, axis: .vertical)
					.lineLimit(2...4)
					.font(.body)
					.multilineTextAlignment(.leading)
					.padding(.bottom, 20)
					.padding(.leading,20)
					.padding(.trailing,10)
					.focused($isFocused)
					.submitLabel(.done)
					.onChange(of: ingredient.notes) { oldValue, newValue in
						guard isFocused else { return }
						guard newValue.last == "\n" else { return }

						ingredient.notes.removeLast()
						isFocused = false
					}
			}
        }
        .navigationBarTitle("Editor Screen")
        .navigationBarTitleDisplayMode(.inline)
		
		//MARK: - Save/Cancel
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save"){
                    onSave(ingredient)
                    dismiss()
                }
				.disabled(!canSave)
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
        IngredientEditor{ savedIngredient in
            print("savedIngredient")
        }
    }
}
