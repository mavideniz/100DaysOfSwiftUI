//
//  ContentView.swift
//  iExpense
//
//  Created by Doğancan Mavideniz on 29.08.2021.
//

import SwiftUI



struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View{
        Text("Your name is \(name)")
        
        Button("Dismiss"){
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        
            
        Button("Go second!"){
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet){
            SecondView(name: "dogancan")
            
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
