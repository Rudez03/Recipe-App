//
//  IngredientEditor.swift
//  Recipe App
//
//  Created by Chacho on 7/31/26.
//

import SwiftUI

struct IngredientEditor: View {
	@State private var draftIngredient: DraftIngredient
    @Environment(\.dismiss) private var dismiss
    
	init(draftIngredient: DraftIngredient = DraftIngredient(), onSave: @escaping (DraftIngredient) -> Void, onDelete: (()-> Void)? = nil) {
		_draftIngredient = State(initialValue: draftIngredient)
		self.onSave = onSave
		self.onDelete = onDelete
	}

	
	//MARK: - Saving function/validation
    var onSave: (DraftIngredient) -> Void
	
	private var canSave: Bool {
		!draftIngredient.name
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.isEmpty
	}
	
	//MARK: - Delete function/validation
	var onDelete: (() -> Void)?
	
	//MARK: - Keyboard Focus cases
	enum Field {
		case name
		case amount
	}
	@FocusState private var focusedField: Field?
	@FocusState private var isFocused: Bool
	
	//MARK: - Add Fraction
	private func addFrac (_ fraction: String) {
		var parts = draftIngredient.amount.split(separator: " ")
		
		if parts.isEmpty {
			draftIngredient.amount = fraction
			return
		}
		
		if let lastPart = parts.last {
			if lastPart.contains("/") {
				parts.removeLast()
			}
		}
		parts.append(Substring(fraction))
		draftIngredient.amount = parts.joined(separator: " ")
	}
	
	
    var body: some View {
        ScrollView {
			VStack {
                TextField("Ingredient Name", text: $draftIngredient.name, axis: .vertical)
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
                    .onChange(of: draftIngredient.name) { _, newValue in
                        guard newValue.contains("\n") else {return}
                        
                        draftIngredient.name = newValue.replacingOccurrences(of: "\n", with: "")
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
							TextField("0", text: $draftIngredient.amount)
								.keyboardType(.decimalPad)
								.focused($focusedField, equals: .amount)
								.font(.title3)
								.frame(width: 60)
								.toolbar {
									ToolbarItemGroup(placement: .keyboard) {
										if focusedField == .amount {
											Group {
												Button {
													addFrac("1/8")
												} label: {
													Text("1/8")
												}
												Button {
													addFrac("1/4")
												} label: {
													Text("1/4")
												}
												
												Button {
													addFrac("1/3")
												} label: {
													Text("1/3")
												}
												
												Button {
													addFrac("1/2")
												} label: {
													Text("1/2")
												}
												
												Button {
													addFrac("2/3")
												} label: {
													Text("2/3")
												}
												
												Button {
													addFrac("3/4")
												} label: {
													Text("3/4")
												}
											}
											.disabled(draftIngredient.amount.contains("."))
											
											Button {
												focusedField = nil
											} label: {
												Image(systemName: "checkmark.circle.fill")
											}
										}
									}
                                    
								}
							
							Divider()
								.frame(height: 30)
								.frame(width: 50)
							
							// Unit picker
                            Picker("Unit", selection: $draftIngredient.unit) {
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
				TextField("Add Notes", text: $draftIngredient.notes, axis: .vertical)
					.lineLimit(3...5)
					.font(.body)
					.padding(12)
					.frame(maxWidth: .infinity, alignment: .leading)
					.background {
						RoundedRectangle(cornerRadius: 16)
							.fill(.gray.opacity(0.2))
					}
					.padding(.horizontal)
					.focused($isFocused)
					.submitLabel(.done)
					.onChange(of: draftIngredient.notes) { oldValue, newValue in
						guard isFocused else { return }
						guard newValue.last == "\n" else { return }

						draftIngredient.notes.removeLast()
						isFocused = false
					}
				
				// MARK: - Delete Button
				if let onDelete {
					Button(role: .destructive, action: {
						onDelete()
                        dismiss()
						
					}) {
						Text("Delete")
                            .font(.body)
							.padding(10)
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
                    onSave(draftIngredient)
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
