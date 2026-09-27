//
//  RecipeStepDisplay.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 9/25/26.
//

import SwiftUI

struct RecipeStepDisplay: View {
    let recipeStep: RecipeStep
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10){
            Text("Step \(recipeStep.step + 1)")
				.fontWeight(.bold)
                .underline()
                
			
            Text(recipeStep.name)
			
            Text(recipeStep.details)
            
            Rectangle() // or use Divider later 
                .frame(height: 1)
                .opacity(0.3)
                
		}
        .padding(.vertical)
    }
}

#Preview {
    RecipeStepDisplay(recipeStep: RecipeStep(step: 0, name:"Mix", details: "mix thoroughly"))
}

