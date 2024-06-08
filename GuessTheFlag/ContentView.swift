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
//            LinearGradient(stops: [
//                .init(color: .white, location: 0.45),
//                .init(color: .black, location: 0.55)
//            ], startPoint: .top, endPoint: .bottom)
//            
//            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
//            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .blue], center: .center)
//
            Text("Your content here")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.indigo.gradient)
            
            
        }
    }
}

#Preview {
    ContentView()
}
