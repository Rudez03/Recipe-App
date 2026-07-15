//
//  Featuretabs.swift
//  Recipe App
//
//  Created by Chacho on 2/21/26.
//

import SwiftUI

struct HomeFeatCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            Text(description)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.25)
                .brightness(-0.4)
            
        }
    
    }
}

#Preview {
    HomeFeatCard(iconName: "text.book.closed",
                    description: "A place to find your recipes")
            .padding()
}
