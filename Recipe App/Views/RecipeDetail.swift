//
//  RecipeDetail.swift
//  Recipe App
//
//  Created by Chacho on 6/3/26.
//

import SwiftUI

struct RecipeDetail: View {
	@State private var isEdit = false
    @Environment(\.dismiss) private var dismiss
    
    let recipe: Recipe
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading){
                    
                    // MARK: - Header
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
                    
                    // MARK: - Time and Servings
                    HStack{
                        Label("\(recipe.displayTime)", systemImage: "clock")
                        Spacer()
                        
                        if let servings = recipe.servings {
                            Label(
                                    "\(servings) servings",
                                    systemImage: "person.crop.circle"
                                )
                            .padding(5)
                        }
                        else {
                            Label("Serving Size", systemImage: "person.crop.circle")
								//.padding(5)
							
								
						}
                    }
                    .padding(.bottom)
                    
                    // MARK: - Description
                    Text(recipe.descrip)
                        .font(.body)
                        //.frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 30)
                    
                    
                    // MARK: - Ingredients
                    Text("Ingredients")
                        .font(.title3.bold())
                        //.underline()
                        .padding(.bottom, 5)
                    
                    
                    ForEach(recipe.ingredients) { ingredient in
                        IngredientRow(displayText: ingredient.displayText,
                                      notes: ingredient.notes)
                    }
                    
                    
                    // MARK: - Instructions
                    Text("Instructions")
                        .font(.title3.bold())
                       // .underline()
                        .padding(.top,5)
                        .padding(.bottom, 5)

				
					Text(recipe.instructions)
						.font(.body)
						.padding(.bottom, 30)
                    Spacer()
                    
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .padding()
        //.navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
		
		// MARK: Edit
		.toolbar {
			ToolbarItem {
				Button(action: {
					isEdit.toggle()
				}) {
					HStack{
						Text("Edit")
					}
					// .foregroundStyle(.black)
				}
				.fullScreenCover(isPresented: $isEdit) {
				} content: {
					NavigationStack {
                        EditRecipe(recipe: recipe){
                            dismiss()
                        }
					}
				}
			}
			
		}

    }
}

#Preview {
    NavigationStack {
        RecipeDetail(recipe: Recipe(
            name: "Roasted Garlic Parmesan Chicken Alfredo with Sun-Dried Tomatoes and Fresh Basil",
            descrip: "A rich and creamy homemade Alfredo tossed with grilled chicken, roasted garlic, sun-dried tomatoes, fresh basil, and parmesan cheese. Perfect for testing long text wrapping and overall layout spacing within the recipe detail screen.",
            ingredients: [

                Ingredient(
                    name: "Boneless Skinless Chicken Breasts",
                    amount: "2",
                    unit: .pound,
                    notes: "Slice into thin cutlets for quicker cooking and more even browning."
                ),

                Ingredient(
                    name: "Fettuccine Pasta",
                    amount: "16",
                    unit: .ounce
                ),

                Ingredient(
                    name: "Heavy Whipping Cream",
                    amount: "2",
                    unit: .cups,
                    notes: "Bring to room temperature before adding to prevent the sauce from separating."
                ),

                Ingredient(
                    name: "Freshly Grated Parmesan Cheese",
                    amount: "2½",
                    unit: .cups,
                    notes: "Avoid pre-shredded cheese because it contains anti-caking agents that can make the sauce grainy and prevent it from melting smoothly."
                ),

                Ingredient(
                    name: "Roasted Garlic Cloves",
                    amount: "8"
                ),

                Ingredient(
                    name: "Sun-Dried Tomatoes Packed in Olive Oil",
                    amount: "¾",
                    unit: .cups,
                    notes: "Drain well before chopping into bite-sized pieces."
                ),

                Ingredient(
                    name: "Fresh Basil Leaves",
                    amount: "¼",
                    unit: .cups
                ),

                Ingredient(
                    name: "Kosher Salt"
                ),

                Ingredient(
                    name: "Freshly Cracked Black Pepper"
                ),

                Ingredient(
                    name: "Unsalted Butter",
                    amount: "4",
                    unit: .tablespoon
                ),

                Ingredient(
                    name: "Italian Seasoning Blend",
                    amount: "2",
                    unit: .teaspoon,
                    notes: "If using homemade seasoning, increase the oregano slightly for additional flavor."
                ),

                Ingredient(
                    name: "Crushed Red Pepper Flakes",
                    amount: "1",
                    unit: .teaspoon
                ),

                Ingredient(
                    name: "Fresh Lemon Juice",
                    amount: "1",
                    unit: .tablespoon
                ),

                Ingredient(
                    name: "Fresh Parsley",
                    amount: "2",
                    unit: .tablespoon
                ),

                Ingredient(
                    name: "Extra Virgin Olive Oil",
                    amount: "2",
                    unit: .tablespoon,
                    notes: "Use a good-quality olive oil because the flavor is noticeable in the finished dish."
                )
            ],
            
            totalMins: 105,
            
            instructions: """
            1. Bring a large pot of generously salted water to a boil.

            2. Season the chicken with salt, pepper, and Italian seasoning before searing until golden brown.

            3. Remove the chicken and allow it to rest while preparing the sauce.

            4. Melt the butter, cook the roasted garlic until fragrant, then slowly whisk in the heavy cream.

            5. Add the parmesan a little at a time while continuously stirring until completely melted.

            6. Stir in the sun-dried tomatoes, basil, parsley, and lemon juice.

            7. Add the cooked pasta directly into the sauce and toss until every noodle is coated.

            8. Slice the rested chicken and place it over the pasta before serving with additional parmesan and freshly cracked black pepper.
            """
        )
                     
        )
    }
    
}
