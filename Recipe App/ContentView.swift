//
//  ContentView.swift
//  Recipe App
//
//  Created by Chacho on 2/19/26.
//

import SwiftUI


//let gradientColors: [Color] = [
//    .gradientTop,
//    .gradientBot
//]

struct ContentView: View{
    
    var body: some View {
        //.navigationTitle("Home")
        
            
                TabView {
                    WelcomePage()
			.tabItem {
			    Label("Home", systemImage: "house.fill") //
}
                        //.background(Color.clear)
			//.toolbarBackground(.hidden, for: .navigationBar)
                    
                    HomePage()
                       // .background(Color.clear)
                }
                
		.background(AppBackground())
                .tabViewStyle(.page)
		.foregroundStyle(.white)
//
        
    }
}

#Preview {
    ContentView()
    
}

