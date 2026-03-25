//
//  WelcomePage.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        

    
	    VStack {
		
		ZStack {
		    RoundedRectangle(cornerRadius: 30)
			.frame(width: 150, height: 150)
			.foregroundStyle(.tint)
		    
		    Image(systemName: "book.pages")
			.font(.system(size: 70))
			.foregroundStyle(.white)
		    
		}
		
		
		Text("Welcome to Your Recipes")
		    .font(.title)
		    .fontWeight(.semibold)
		    .padding(.top)
		
		Text("Your Personal Recipe Assistant!")
		    .font(.title3)
		
	    }
	    .padding()
    }
}

#Preview {
    WelcomePage()
}
