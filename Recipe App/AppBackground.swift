//
//  AppBackground.swift
//  Recipe App
//
//  Created by Chacho on 2/22/26.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        LinearGradient(
                    colors: [.gradientTop, .gradientBot],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
    }
}

#Preview {
    AppBackground()
}
