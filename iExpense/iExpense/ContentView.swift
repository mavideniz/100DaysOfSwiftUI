//
//  ContentView.swift
//  iExpense
//
//  Created by Doğancan Mavideniz on 29.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    class User: ObservableObject {
        
        
        
        @Published var name = "Dogancan"
        @Published var surname = "Mavideniz"
        
    }
    @ObservedObject private var user = User()
    var body: some View {
        VStack{
            
            Text("Your name is \(user.name), surname is \(user.surname)")
            
            TextField("Your first name",text:$user.name)
                .padding()
            TextField("Your second name",text:$user.surname)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
