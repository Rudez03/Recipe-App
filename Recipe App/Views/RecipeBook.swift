//
//  RecipeBook.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI
import SwiftData

struct RecipeBook: View {
    @State private var isShowingRecipe = false
    @State private var searchText = ""
    
    @Query private var recipes: [Recipe]
	
	@Environment(\.modelContext) private var modelContext
	
//	= [
//        Recipe(name: "Cookies",
//                       descrip: "Soft and chewy",
//                       ingredients: [],
//                       totalMins: 20
//                ),
//        
//                Recipe(name: "Concha Cupcakes",
//                       descrip: "Sweet and cute",
//                       ingredients: [],
//                       totalMins: 45
//                ),
//        
//                Recipe(name: "Strawberry Cheesecake",
//                       descrip: "Refreshing and Sweet",
//                       ingredients: [],
//                       totalMins: 15
//                ),
//        
//                Recipe(name: "Churro Cheesecake",
//                       descrip: "Warm yet nastolgic",
//                       ingredients: [],
//					   totalMins: 90
//                ),
//        Recipe(
//                   name: "Roasted Garlic Parmesan Chicken Alfredo with Sun-Dried Tomatoes and Fresh Basil",
//                   descrip: "A rich and creamy homemade Alfredo tossed with grilled chicken, roasted garlic, sun-dried tomatoes, fresh basil, and parmesan cheese. Perfect for testing long text wrapping and overall layout spacing within the recipe detail screen.",
//                   ingredients: [
//       
//                        Ingredient(
//                            name: "Boneless Skinless Chicken Breasts",
//                            amount: "2",
//                            unit: .pound,
//                            notes: "Slice into thin cutlets for quicker cooking and more even browning."
//                        ),
//
//                        Ingredient(
//                            name: "Fettuccine Pasta",
//                            amount: "16",
//                            unit: .ounce
//                        ),
//
//                        Ingredient(
//                            name: "Heavy Whipping Cream",
//                            amount: "2",
//                            unit: .cups,
//                            notes: "Bring to room temperature before adding to prevent the sauce from separating."
//                        ),
//
//                        Ingredient(
//                            name: "Freshly Grated Parmesan Cheese",
//                            amount: "2½",
//                            unit: .cups,
//                            notes: "Avoid pre-shredded cheese because it contains anti-caking agents that can make the sauce grainy and prevent it from melting smoothly."
//                        ),
//
//                        Ingredient(
//                            name: "Roasted Garlic Cloves",
//                            amount: "8"
//                        ),
//
//                        Ingredient(
//                            name: "Sun-Dried Tomatoes Packed in Olive Oil",
//                            amount: "¾",
//                            unit: .cups,
//                            notes: "Drain well before chopping into bite-sized pieces."
//                        ),
//
//                        Ingredient(
//                            name: "Fresh Basil Leaves",
//                            amount: "¼",
//                            unit: .cups
//                        ),
//
//                        Ingredient(
//                            name: "Kosher Salt"
//                        ),
//
//                        Ingredient(
//                            name: "Freshly Cracked Black Pepper"
//                        ),
//
//                        Ingredient(
//                            name: "Unsalted Butter",
//                            amount: "4",
//                            unit: .tablespoon
//                        ),
//
//                        Ingredient(
//                            name: "Italian Seasoning Blend",
//                            amount: "2",
//                            unit: .teaspoon,
//                            notes: "If using homemade seasoning, increase the oregano slightly for additional flavor."
//                        ),
//
//                        Ingredient(
//                            name: "Crushed Red Pepper Flakes",
//                            amount: "1",
//                            unit: .teaspoon
//                        ),
//
//                        Ingredient(
//                            name: "Fresh Lemon Juice",
//                            amount: "1",
//                            unit: .tablespoon
//                        ),
//
//                        Ingredient(
//                            name: "Fresh Parsley",
//                            amount: "2",
//                            unit: .tablespoon
//                        ),
//
//                        Ingredient(
//                            name: "Extra Virgin Olive Oil",
//                            amount: "2",
//                            unit: .tablespoon,
//                            notes: "Use a good-quality olive oil because the flavor is noticeable in the finished dish."
//                        )
//                   ],
//                   totalMins: 105,
//                   
//                   instructions: """
//                   1. Bring a large pot of generously salted water to a boil.
//                   
//                   2. Season the chicken with salt, pepper, and Italian seasoning before searing until golden brown.
//                   
//                   3. Remove the chicken and allow it to rest while preparing the sauce.
//                   
//                   4. Melt the butter, cook the roasted garlic until fragrant, then slowly whisk in the heavy cream.
//                   
//                   5. Add the parmesan a little at a time while continuously stirring until completely melted.
//                   
//                   6. Stir in the sun-dried tomatoes, basil, parsley, and lemon juice.
//                   
//                   7. Add the cooked pasta directly into the sauce and toss until every noodle is coated.
//                   
//                   8. Slice the rested chicken and place it over the pasta before serving with additional parmesan and freshly cracked black pepper.
//                   """
//               )
//    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var recipesShown: [Recipe]  {
        if searchText.isEmpty {
            return recipes
        }
        else {
            return recipes.filter { recipe in
                recipe.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if recipes.isEmpty {
                    ContentUnavailableView(
                        "No Recipes Yet",
                        systemImage: "book.closed",
                        description: Text("Your saved recipes will appear here.")
                    )
                } else if recipesShown.isEmpty{
                    ContentUnavailableView.search
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns){
                            ForEach(recipesShown) { recipe in
                                NavigationLink {
                                    RecipeDetail(recipe: recipe)
                                } label: {
                                    RecipeCard(recipe: recipe)
                                    
                                }
                                .buttonStyle(.plain)
                             }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                        .padding(.horizontal)
                    }
                    
                }
            }
            .navigationTitle("Recipe Book")
            .searchable(text: $searchText, placement: .navigationBarDrawer)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingRecipe.toggle()
                    }) {
                        HStack{
                            Image(systemName: "plus")
                        }
                       // .foregroundStyle(.black)
                    }
                    .fullScreenCover(isPresented: $isShowingRecipe) {
                    } content: {
                        NavigationStack {
                            NewRecipe{ savedRecipe in
								modelContext.insert(savedRecipe)
                            }
                        }
                    }
                }
            }
            
            
        }
     

    }
}

#Preview {
        RecipeBook()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty Book") {
    RecipeBook()
        .modelContainer(for: [Recipe.self, Ingredient.self], inMemory: true)
}
