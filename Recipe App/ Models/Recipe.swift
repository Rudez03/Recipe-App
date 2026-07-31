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
    var totalMins: Int?
    var servings: Int?
    var icon: String?
    // make a list of strings I think....
    var instructions: String?
    
    // MARK: - Computed Properties
//    var totalMins: Int {
//        let hoursInMin = (hours ?? 0) * 60
//        let selectedMins = mins ?? 0
//        
//        return hoursInMin + selectedMins
//    }
    
//    var displayTime: String {
//        if totalMins == 0 {
//            return ""
//        }
//        else {
//            
//        }
//    }
    
    
    
    
    
   
    
 
    
}
