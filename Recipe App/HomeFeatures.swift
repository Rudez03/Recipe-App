//
//  HomeFeatures.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI

struct HomeFeatures: View {
    
    var body: some View {
        VStack(spacing: 15) {
            
           
	    HomeFeatCard(iconName: "text.book.closed",
                            description: "Browse your recipes")
	    
            HomeFeatCard(iconName: "checklist",
                                description: "Ingredient checklist")

            HomeFeatCard(iconName: "plus.circle",
                                description: "Add your own recipes")
                }
        .padding(.horizontal, 20)
    
    }
}

#Preview {
    NavigationStack {
            HomeFeatures()
        }
}
