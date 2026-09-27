//
//  RecipeStepDisplay.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 9/25/26.
//

import SwiftUI

struct RecipeStepDisplay: View {
	let step: Int
	let name: String
	let details: String
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10){
			Text("Step \(step + 1)")
				.fontWeight(.bold)
                .underline()
                
			
			Text(name)
			
			Text(details)
            
            Rectangle()
                .frame(height: 1)
                .opacity(0.3)
                
           // Divider()
		}
        .padding(.vertical)
    }
}

#Preview {
	RecipeStepDisplay(step: 0, name:"Mix", details: "mix thoroughly")
}
