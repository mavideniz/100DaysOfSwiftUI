//
//  ContentView.swift
//  Animations
//
//  Created by Doğancan Mavideniz on 14.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation{
                    self.isShowingRed.toggle()
                }
            
            }

            if isShowingRed {
                Rectangle()
                    
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
