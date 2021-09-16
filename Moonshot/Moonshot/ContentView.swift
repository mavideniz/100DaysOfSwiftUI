//
//  ContentView.swift
//  Moonshot
//
//  Created by Doğancan Mavideniz on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0..<100){ row in
                NavigationLink(destination: Text("Row \(row)")){
                    Text("Hello Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
