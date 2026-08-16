//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Chacho on 2/19/26.
//

import SwiftUI
import SwiftData


@main
struct Recipe_AppApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeBook()
        }
		.modelContainer(for: [Recipe.self, Ingredient.self])
    }
}
