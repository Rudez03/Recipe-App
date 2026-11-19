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
        _isShowingRange = State(initialValue: !(draftIngredient.range ?? "").isEmpty)
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
        case range
	}
	@FocusState private var focusedField: Field?
	@FocusState private var isFocused: Bool
	

	
	//MARK: - Add Fraction
	private func addFrac (_ fraction: String) {
		
		let currentText: String
		
		if focusedField == .amount {
			currentText = draftIngredient.amount
		} else if focusedField == .range {
			currentText = draftIngredient.range ?? ""
		}
		else {
			return
		}
		
		var parts = currentText.split(separator: " ")
		
		
		if let lastPart = parts.last {
			if lastPart.contains("/") {
				parts.removeLast()
			}
		}
		
		parts.append(Substring(fraction))
		let updatedText = parts.joined(separator: " ")
		if focusedField == .amount {
			draftIngredient.amount = updatedText
		} else if focusedField == .range {
			draftIngredient.range = updatedText
		}
		
	}
	
	
	@State private var isShowingRange = false
	
	
	//MARK: -keyboard toolbar validation
	private var disableFrac: Bool{
		if focusedField == .amount {
			return draftIngredient.amount.contains(".")
		} else if focusedField == .range {
			return (draftIngredient.range ?? "").contains(".")
		} else {
			return false
		}
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
//					ZStack{
//						Capsule()
//							.fill(Color.gray.opacity(0.2))
//							.frame(height: 40)
//							.frame(width:300 )
//							
						HStack{
							// Amount
							TextField("0", text: $draftIngredient.amount)
                                .padding(.leading)
								.keyboardType(.decimalPad)
								.focused($focusedField, equals: .amount)
								.font(.title3)
								.frame(width: 80)
								
							
							// Amount Range optional
							if isShowingRange == true {
								Text("to")
                                    .padding(.horizontal,5)
								
								TextField("0", text: Binding(
									get: {
										draftIngredient.range ?? ""
									},
									set: { newText in
										draftIngredient.range = newText
									}
								))
                                .focused($focusedField, equals: .range)
                                .font(.title3)
                                .padding(.leading)
                                .frame(width: 80)
                                .keyboardType(.decimalPad)
								

							}
							
							Divider()
								.frame(height: 30)
//								.frame(width: 50)
							
							// Unit picker
                            Picker("Unit", selection: $draftIngredient.unit) {
                                ForEach(IngredientUnit.allCases, id: \.self) { unit in
									Text(unit.displayName)
										.tag(unit)
                                
                                    
                                }
                            }
                            .tint(.primary)
                            .fixedSize(horizontal: true, vertical: false)
						}
				}
                .background {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading)
				.padding(.trailing)
                
				Button {
					isShowingRange = true
				} label: {
					Text("Range")
				}
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
				//.padding(.bottom)
				
				
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
		.toolbar {
			ToolbarItemGroup(placement: .keyboard) {
				if focusedField == .amount || focusedField == .range {
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
					.disabled(disableFrac)
					
					Button {
						focusedField = nil
					} label: {
						Image(systemName: "checkmark.circle.fill")
					}
				}
			}
			
		}
		.background(Color(uiColor: .systemBackground))
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
