//
//  RecipeCategory.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 9/28/26.
//

import Foundation


enum RecipeCategory: String, CaseIterable, Codable, Hashable {
	case breakfast
	case lunch
	case dinner
	case appetizers
	case snacks
	case desserts
	case drinks
    
    var displayName: String {
        switch self {
            case .breakfast: return "Breakfast"
            case .lunch: return "Lunch"
            case .dinner: return "Dinner"
            case .appetizers: return "Appetizers"
            case .snacks: return "Snacks"
            case .desserts: return "Desserts"
            case .drinks: return "Drinks"
        }
    }
}
