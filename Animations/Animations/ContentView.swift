//
//  ContentView.swift
//  Animations
//
//  Created by Doğancan Mavideniz on 14.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    
    var body: some View {
        Button("Tap Me") {
            // do nothing
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.red : Color.blue)
        .foregroundColor(.white)
        .animation(nil)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
