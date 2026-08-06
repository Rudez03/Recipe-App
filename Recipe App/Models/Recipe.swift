//
//  Recipe.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 3/25/26.
//

import Foundation

struct Recipe: Identifiable {
    
    // MARK: - Identity
	let id = UUID()
	
    // MARK: - Reicpe Data
	var name: String
	var description: String = ""
    var ingredients: [Ingredient] = []
	var prepTime: String = ""
    var totalMins: Int = 0
    var servings: Int?
    var icon: String?
    // make a list of strings I think....
    var instructions: String?
    
    // MARK: - Computed Properties
    var displayTime: String {
        if totalMins == 0 {
            return "N/A"
        }
        else {
            let hours = totalMins/60
            let rMins = totalMins%60
            
            if hours == 0 {
                return "\(rMins) mins"
            }
            else {
                return "\(hours) hrs \(rMins) mins"
            }
           
        }
    }
    
    
    
    
    
   
    
 
    
}
