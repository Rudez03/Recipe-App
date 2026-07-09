//
//  Ingredients.swift
//  Recipe App
//
//  Created by Chacho on 6/30/26.
//

import Foundation


struct Ingredient: Identifiable {
    let id: UUID = UUID()
    
    var name: String
    var amount: String?
    var measurement: String?
    var notes: String?
    
    // checks for notes
    var hasNotes: Bool {
        notes != nil
    }
    
    //prepares not for display in the view 
    var displayNotes: String {
        notes ?? ""
    }
    
    
    // Displays ingredient in "amount, measurement, name", "amount, name" or "name" pattern
    var displayText: String {
        if let amount = amount {
            if let measurement = measurement{
                return "\(amount) \(measurement) \(name)"
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


