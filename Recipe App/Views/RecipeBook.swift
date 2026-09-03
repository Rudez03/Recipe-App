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
	
    // MARK: - Columns def
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Recipe filter
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
                // Empty State
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
            // MARK: - Toolbar
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
		.modelContainer(for: [Recipe.self, Ingredient.self, RecipeStep.self], inMemory: true)
}
