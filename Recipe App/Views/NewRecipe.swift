//
//  NewRecipe.swift
//  Recipe App
//
//  Created by Chacho on 7/15/26.
//

import SwiftUI

struct NewRecipe: View {
    @State private var recipe = Recipe(name:"")
    @State var hours = 0
    @State var mins = 0
    @Environment(\.dismiss) private var dismiss

	// MARK: - Saving fucntion/Validation
	var onSave: (Recipe) -> Void
	private var canSave: Bool {
		!recipe.name
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.isEmpty
	}
	
	// Keyboard dismissal
	@FocusState private var isFocused: Bool
	
    @State private var isShowingIngredient = false
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: - Header
                TextField("Recipe Name", text: $recipe.name, axis: .vertical)
					.focused($isFocused)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    .padding(.leading)
                    .padding(.trailing)
					.submitLabel(.done)
                    .onChange(of: recipe.name) { oldValue, newValue in
                        guard isFocused else { return }
                        guard newValue.last == "\n" else { return }

                        recipe.name.removeLast()
                        isFocused = false
                    }
                
                
                
                // MARK: - Time and Servings
                HStack{
                    
                    // MARK: hrs
                    Image(systemName: "clock")
                        .padding(.leading)
                    
                    Picker("Hours", selection: $hours) {
                        ForEach(0...24, id: \.self) { hr in
                            Text("\(hr) hrs")
                                .tag(hr)
                        }
                    }
                    .pickerStyle(.menu)
                    .fixedSize(horizontal: true, vertical: false)
                    
                    // MARK: Mins
                    Picker("Mins", selection: $mins) {
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
                    Picker("serving size", selection: $recipe.servings) {
                        Text("Not Set")
                            .tag(nil as Int?)
                        
                        ForEach( 1...20, id: \.self) { number in
                            Text("\(number) servings")
                                .tag(Optional(number))
                            
                        }
                    }
                    
                }
                .pickerStyle(.menu)
                .padding(.bottom)
                
                
                
                // MARK: - Description
                TextField("Add Description", text: $recipe.descrip, axis: .vertical)
					.focused($isFocused)
                    .lineLimit(2...4)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .padding(.leading)
					.padding(.trailing,10)
					.submitLabel(.done)
					.onChange(of: recipe.descrip) { oldValue, newValue in
						guard isFocused else { return }
						guard newValue.last == "\n" else { return }

						recipe.descrip.removeLast()
						isFocused = false
					}
					
                
                
                
                // MARK: - Ingredients
                Text("Ingredients")
                    .font(.title3.bold())
                    .padding(.leading)
                    .padding(.bottom, 5)
				
                ForEach(recipe.ingredients) { ingredient in
                    IngredientRow(displayText: ingredient.displayText,
                                  notes: ingredient.notes)
                }
				.padding(.leading)
				
                // ingredient sheet presentation
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
                .padding(.leading)
                .sheet(isPresented: $isShowingIngredient) {
                } content: {
                    NavigationStack{
                        IngredientEditor{ savedIngredient in
                            recipe.ingredients.append(savedIngredient)
                        }
                            .presentationDetents([.medium, .medium])
                    }
                }
                
                
                
                
                
                // MARK: - Instructions
                Text("Instructions")
                    .font(.title3.bold())
                    .padding(.leading)
                    .padding(.top,5)
                    .padding(.bottom, 5)
                
					
					TextField("Add Instructions ", text: $recipe.instructions, axis: .vertical )
						.focused($isFocused)
						.font(.body)
						.multilineTextAlignment(.leading)
						.padding(.bottom, 20)
						.padding(.leading)
						.padding(.trailing,10)
						.submitLabel(.done)
						.onChange(of: recipe.instructions) { oldValue, newValue in
							guard isFocused else { return }
							guard newValue.last == "\n" else { return }
							
							recipe.instructions.removeLast()
							isFocused = false
						}
				.foregroundStyle(.gray)
                Spacer()
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarTitle("New Recipe")
        .navigationBarTitleDisplayMode(.inline)
		
		// MARK: - Saving/Cancel actions
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save"){
                    recipe.totalMins = (hours * 60) + mins
                    onSave(recipe)
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
    NavigationStack{
        NewRecipe{ savedRecipe in
            print("savedRecipe")
        }
    }
}
