//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jingjing Mao on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your content here")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
