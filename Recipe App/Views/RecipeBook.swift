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
    
// Category
    @Query(sort: \Recipe.name, order: .forward)
    private var recipes: [Recipe]
    @State private var selectedCategory: RecipeCategory? = nil
    
	@Environment(\.modelContext) private var modelContext
	
// MARK: - Columns def
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
// MARK: - Recipe filter
    var recipesShown: [Recipe]  {
        return recipes.filter { recipe in
            let matchesSearch = searchText.isEmpty || recipe.name.lowercased().contains(searchText.lowercased())
            let matchesCategory: Bool
            if let selectedCategory {
                matchesCategory = recipe.categories.contains(selectedCategory)
            } else  {
                matchesCategory = true
            }
            return matchesCategory && matchesSearch
        }
        .sorted {
            $0.name.localizedStandardCompare($1.name) == .orderedAscending
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack(spacing: 6) {
                        Spacer()
                        Menu {
                            Picker("Category", selection: $selectedCategory) {
                                Text("All Recipes")
                                    .tag(nil as RecipeCategory?)
                                ForEach(RecipeCategory.allCases, id: \.self) { category in
                                    Text(category.displayName)
                                        .tag(Optional(category))
                                }
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "slider.horizontal.3")
                                Text(selectedCategory?.displayName ?? "All Recipes")
                                Image(systemName: "chevron.down")
                                    .font(.caption)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .glassEffect(.regular, in: Capsule())
                        }
                        .accessibilityLabel("Filter recipes")
                    }
                    .padding(.horizontal)
                    Group {
                        // Empty State
                        if recipes.isEmpty {
                            ContentUnavailableView(
                                "No Recipes Yet",
                                systemImage: "book.closed",
                                description: Text("Your saved recipes will appear here.")
                            )
                        } else if recipesShown.isEmpty{
                            if !searchText.isEmpty {
                                ContentUnavailableView.search
                            } else if let selectedCategory {
                                ContentUnavailableView("No recipes in \(selectedCategory.displayName)", systemImage: "book.closed")
                            }
                        } else {
                            
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
}

#Preview {
        RecipeBook()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty Book") {
    RecipeBook()
		.modelContainer(for: [Recipe.self, Ingredient.self, RecipeStep.self], inMemory: true)
}
