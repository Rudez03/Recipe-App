//
//  IngredientEditor.swift
//  Recipe App
//
//  Created by Chacho on 7/31/26.
//

import SwiftUI

struct IngredientEditor: View {
	@State private var draft: DraftIngredient
    @Environment(\.dismiss) private var dismiss
    
	init(draftIngredient: DraftIngredient = DraftIngredient(), onSave: @escaping (DraftIngredient) -> Void, onDelete: (()-> Void)? = nil) {
		_draft = State(initialValue: draftIngredient)
		self.onSave = onSave
		self.onDelete = onDelete
	}

	
	//MARK: - Saving function/validation
    var onSave: (DraftIngredient) -> Void
	
	private var canSave: Bool {
		!draft.name
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.isEmpty
	}
	
	// MARK: - Delete function/validation
	var onDelete: (() -> Void)?
	
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
//				ZStack {
//					// MARK: - Ingredient Name
//					Capsule()
//						.fill(Color.gray.opacity(0.2))
//						.frame(height: 50)
//						.padding(.leading)
//						.padding(.trailing)
//					TextField("Ingredient Name", text: $draft.name)
//						.font(.title)
//						.padding(.leading, 40)
//                       .padding(.trailing, 40)
//						.focused($focusedField, equals: .name)
//						.submitLabel(.next)
//						.onSubmit {
//							focusedField = .amount
//						}
//				}
//				.padding(.top,25)
//				.padding(.bottom, 5)
                
                TextField("Ingredient Name", text: $draft.name, axis: .vertical)
                    .font(.title)
                    .padding(.horizontal, 30)
                        .padding(.vertical, 5)
                        .background {
                            RoundedRectangle(cornerRadius: 22)
                                .fill(.gray.opacity(0.2))
                        }
                        .padding(.horizontal) // outside screen margin
                    .focused($focusedField, equals: .name)
                    .submitLabel(.next)
                    .onChange(of: draft.name) { _, newValue in
                        guard newValue.contains("\n") else {return}
                        
                        draft.name = newValue.replacingOccurrences(of: "\n", with: "")
                        focusedField = .amount
                    }
                
                
                
				
				
				// MARK: - Amount/Unit
				HStack{
					ZStack{
						Capsule()
							.fill(Color.gray.opacity(0.2))
							.frame(height: 40)
							.frame(width:300 )
							
						HStack{
							// Amount
							TextField("0", text: $draft.amount)
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
                            Picker("Unit", selection: $draft.unit) {
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
				TextField("Add Notes", text: $draft.notes, axis: .vertical)
					.lineLimit(2...4)
					.font(.body)
					.multilineTextAlignment(.leading)
					.padding(.bottom, 20)
					.padding(.leading,20)
					.padding(.trailing,10)
					.focused($isFocused)
					.submitLabel(.done)
					.onChange(of: draft.notes) { oldValue, newValue in
						guard isFocused else { return }
						guard newValue.last == "\n" else { return }

						draft.notes.removeLast()
						isFocused = false
					}
				
				// MARK: - Delete Button
				if let onDelete {
					Button(role: .destructive, action: {
						onDelete()
                        dismiss()
						
					}) {
						Text("Delete")
							.padding()
							.overlay {
								Capsule()
									.stroke(.red)
							}
						
					}
				}
			}
        }
        .navigationBarTitle("Editor Screen")
        .navigationBarTitleDisplayMode(.inline)
		
		//MARK: - Save/Cancel
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save"){
                    onSave(draft)
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
