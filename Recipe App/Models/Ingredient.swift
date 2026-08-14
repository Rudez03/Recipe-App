//
//  Ingredients.swift
//  Recipe App
//
//  Created by Chacho on 6/30/26.
//

import Foundation
import SwiftData

nonisolated enum IngredientUnit: CaseIterable, Codable {
	case none
    case cups
    case grams
    case kilogram
    case liter
    case pound
    case milliliter
    case ounce
    case pint
    case teaspoon
    case tablespoon
    case stick
    case whole
    case clove
    case can
	
	var displayName: String {
		
		switch self {
			case .none: return "Unit"
			case .cups: return "c"
			case .grams: return "g"
			case .kilogram: return "kg"
			case .liter: return "L"
			case .pound: return "lbs"
			case .milliliter: return "ml"
			case .ounce: return "oz"
			case .pint: return "pint"
			case .teaspoon: return "tsp"
			case .tablespoon: return "tbsp"
			case .stick: return "stick"
			case .whole: return "whole"
			case .clove: return "clove"
			case .can: return "can"
				
		}
	}
}

@Model
class Ingredient: Identifiable {

	//MARK: - Identity
    var id: UUID = UUID()
    
	// MARK: - Ingredient data
    var name: String
    var amount: String
    var unit: IngredientUnit
    var notes: String
    
    var recipe: Recipe? = nil
    
	init(name: String, amount: String = "", unit: IngredientUnit = IngredientUnit.none, notes: String = "") {
		self.name = name
		self.amount = amount
		self.unit = unit
		self.notes = notes
	}
    
    //MARK: - checks for notes
    var hasNotes: Bool {
        notes != ""
    }
    
    //prepares not for display in the view 
//    var displayNotes: String {
//        notes ?? ""
//    }
    
    
    // Displays ingredient in "amount, measurement, name", "amount, name" or "name" pattern
    var displayText: String {
		if amount.isEmpty != true  {
			if unit != .none{
				return "\(amount) \(unit.displayName) \(name)"
            }
            else {
                return "\(amount) \(name)"
            }
        }
        else {
            return "\(name)"
        }
        
    }
}


