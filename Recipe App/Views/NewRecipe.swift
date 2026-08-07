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

	@FocusState private var nameFocus: Bool
	
    var onSave: (Recipe) -> Void
    
    @State private var isShowingIngredient = false
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: - Header
                TextField("Recipe Name", text: $recipe.name, axis: .vertical)
					.focused($nameFocus)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    .padding(.leading)
                    .padding(.trailing)
					
                
                
                
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
                TextField("Add Desciption", text: $recipe.description, axis: .vertical)
                    .lineLimit(2...4)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .padding(.leading)
                 .padding(.trailing,10)
                
                
                
                // MARK: - Ingredients
                Text("Ingredients")
                    .font(.title3.bold())
                    .padding(.leading)
                //.underline()
                    .padding(.bottom, 5)
                ForEach(recipe.ingredients) { ingredient in
                    IngredientRow(ingredient: ingredient)
                }
                    .padding(.leading)
                
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
                            .presentationDetents([.medium, .large])
                    }
                }
                
                
                
                
                
                // MARK: - Instructions
                Text("Instructions")
                    .font(.title3.bold())
                    .padding(.leading)
                    .padding(.top,5)
                    .padding(.bottom, 5)
                
                if let instructions = recipe.instructions {
                    Text("\(instructions)")
                        .padding(.leading)
                }
                else{
                    //will be a button!
                    Text("Add your instructions +")
                        .padding(.leading)
                }
                Spacer()
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarTitle("New Recipe")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save"){
                    recipe.totalMins = (hours * 60) + mins
                    onSave(recipe)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel"){
                    dismiss()
                }
            }
			ToolbarItemGroup(placement: .keyboard) {
					Spacer()

					Button("Done") {
						nameFocus = false
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
