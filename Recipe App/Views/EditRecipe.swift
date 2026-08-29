//
//  EditRecipe.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 8/19/26.
//

import SwiftUI
import SwiftData

struct EditRecipe: View {
	@State private var showAlert: Bool = false
	@Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var draft: DraftRecipe
	
	// Ingredient edit sheet
	@State private var isShowingIngredient = false
	
	@State private var selectedIngredient: DraftIngredient?
    
    // MARK: - Keyboard
    @FocusState private var isFocused: Bool
    
    // MARK: - Draft Init
    init(recipe: Recipe, onDelete: @escaping () -> Void) {
        self.recipe = recipe
        _draft = .init(initialValue: DraftRecipe(from: recipe))
        self.onDelete = onDelete
    }
    
    let recipe: Recipe
    var onDelete: () -> Void
	
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                // MARK: - Name
                TextField("Recipe Name", text: $draft.name, axis: .vertical)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onChange(of: draft.name) { _, newValue in
                        guard newValue.contains("\n") else {return}
                        
                        draft.name = newValue.replacingOccurrences(of: "\n", with: "")
                        isFocused = false
                    }
                
                HStack{
                    
                    // MARK: hrs
                    Image(systemName: "clock")
                        .padding(.trailing, -5)
                    
                    Picker("Hours", selection: $draft.hours) {
                        ForEach(0...24, id: \.self) { hr in
                            Text("\(hr) hrs")
                                .tag(hr)
                        }
                    }
                    .pickerStyle(.menu)
                    .fixedSize(horizontal: true, vertical: false)
                    
                    // MARK: Mins
                    Picker("Mins", selection: $draft.mins) {
                        ForEach(Array(stride(from: 0, through: 55, by: 5)), id: \.self) { min in
                            Text("\(min) mins")
                                .tag(min)
                        }
                    }
                    
                    .pickerStyle(.menu)
                    .fixedSize(horizontal: true, vertical: false)
                    
                    
                    Spacer()
                    
                    // MARK: - Servings
                    Image(systemName: "person.crop.circle")
                        .padding(.trailing, -5)
                    Picker("serving size", selection: $draft.servings) {
                        Text("Not Set")
                            .tag(nil as Int?)
                        
                        ForEach( 1...20, id: \.self) { number in
                            Text("\(number) servings")
                                .tag(Optional(number))
                            
                        }
                    }
                    .padding(.trailing, -14)
                    
                }
                .pickerStyle(.menu)
                .padding(.bottom)
                
                // MARK: - Description
                TextField("Add Description", text: $draft.descrip, axis: .vertical)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 30)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onChange(of: draft.descrip) { oldValue, newValue in
                        guard isFocused else { return }
                        guard newValue.last == "\n" else { return }

                        draft.descrip.removeLast()
                        isFocused = false
                    }
                
                Spacer()
                // MARK: - Ingredients
                Text("Ingredients")
                    .font(.title3.bold())
                    //.underline()
                    .padding(.bottom, 5)
                
                
                ForEach(draft.ingredients) { ingredient in
					Button {
						selectedIngredient = ingredient
					} label: {
						IngredientRow(
							displayText: ingredient.displayText,
							notes: ingredient.notes
						)
					}
					.buttonStyle(.plain)
                }
				.sheet(item: $selectedIngredient) { selected in
					NavigationStack{
						IngredientEditor(draftIngredient: selected,
                            onSave: {updatedDraft in
							if let index = draft.ingredients.firstIndex(where: { ingredient in
								ingredient.id == updatedDraft.id
							}) {
								draft.ingredients[index] = updatedDraft
							}
						},
                            onDelete: { draft.ingredients.removeAll( where: { ingredient in
                                ingredient.id == selected.id
                                             
                            })
                                             
                        }
                                         
                        )
						.presentationDetents([.medium])
					}
				}

				// Add Ingredient Button
				Button(action: {
					isShowingIngredient.toggle()
				}) {
					HStack{
						Image(systemName: "plus.circle")
							.font(.caption)
							.offset(y: 0.2)
						Text("Add Ingredient")
					}
					.foregroundStyle(.gray)
				}
				.sheet(isPresented: $isShowingIngredient) {
				} content: {
					NavigationStack{
						IngredientEditor{ savedDraft in
							draft.ingredients.append(savedDraft)
						}
							.presentationDetents([.medium])
					}
				}
                
                // MARK: - Instructions
                Text("Instructions")
                    .font(.title3.bold())
                    
                    .padding(.top,5)
                    .padding(.bottom, 5)
                
                    
                    TextField("Add Instructions ", text: $draft.instructions, axis: .vertical )
                        .focused($isFocused)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                        .submitLabel(.done)
                        .onChange(of: draft.instructions) { oldValue, newValue in
                            guard isFocused else { return }
                            guard newValue.last == "\n" else { return }
                            
                            draft.instructions.removeLast()
                            isFocused = false
                        }
                .foregroundStyle(.gray)
                Spacer()
                
                // MARK: - Delete action
                Button(role: .destructive, action: {
                    showAlert.toggle()
                    
                }) {
                    Text("Delete Recipe")
                        .font(.body)
                        .padding(10)
                        .overlay {
                            Capsule()
                                .stroke(.red)
                        }
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .confirmationDialog("Are you sure?", isPresented: $showAlert, titleVisibility: .visible) {
                    Button("yes, delete", role: .destructive){
                        modelContext.delete(recipe)
                        onDelete()
                    }
                    
                    Button("Cancel", role: .cancel){
                        
                    }
                }
                
            }
            
			//.padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
       
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        //MARK: - Save/Cancel actions
		.toolbar {
			ToolbarItem(placement: .confirmationAction) {
				Button("Save"){
                    updateRecipe()
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

private extension EditRecipe {
    func updateRecipe() {
        recipe.name = draft.name
        recipe.totalMins = (draft.hours * 60) + draft.mins
        recipe.descrip = draft.descrip
        recipe.servings = draft.servings
        recipe.instructions = draft.instructions
        
       let existingIngredients = recipe.ingredients
        for existing in existingIngredients {
            let stillExisting = draft.ingredients.contains(where: { draftIngredient in
                existing.id == draftIngredient.id
            })
            
            if !stillExisting{
                modelContext.delete(existing)
            }
        }
        
        for draftIngredient in draft.ingredients {
            if let matching = existingIngredients.first(where: { existing in
                existing.id == draftIngredient.id
            }) {
                matching.name = draftIngredient.name
                matching.amount = draftIngredient.amount
                matching.unit = draftIngredient.unit
                matching.notes = draftIngredient.notes
            }
            else {
                let newIngredient = Ingredient(
                        name: draftIngredient.name,
                        amount: draftIngredient.amount,
                        unit: draftIngredient.unit,
                        notes: draftIngredient.notes
                    )
                recipe.ingredients.append(newIngredient)
            }
        }
        
        
        
    }
}


#Preview {
	NavigationStack{
        EditRecipe(recipe: SampleData.shared.sampleRecipe){
            
        }
            .modelContainer(SampleData.shared.modelContainer)
	}
}
