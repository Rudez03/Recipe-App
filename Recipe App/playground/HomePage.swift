//
//  HomePage.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI


struct HomePage: View {
    var body: some View {
        
	
	    VStack {
		Text("Home")
		    .font(.largeTitle)
		    .fontWeight(.semibold)
		    .padding(.bottom)
		    .padding(.top, 100)
		HomeFeatures()
		Spacer()
	    }
	    .background(Color.clear)
        //.backgroundStyle(Color.blue)
       
    }
}

#Preview {
    HomePage()
}
