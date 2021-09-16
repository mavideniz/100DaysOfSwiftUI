//
//  ContentView.swift
//  Moonshot
//
//  Created by Doğancan Mavideniz on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            GeometryReader{ geo in
                Image("example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
