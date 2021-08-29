//
//  ContentView.swift
//  iExpense
//
//  Created by Doğancan Mavideniz on 29.08.2021.
//

import SwiftUI



struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView{
        VStack {
            List {
                ForEach(numbers, id: \.self){
                    Text("\($0)")
                }
                .onDelete(perform: removeRows)
            }
           
        
            
            Button("add number"){
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
                    
            }
            .padding()
            
        
        }
        .navigationBarItems(leading: EditButton())
        }
      
    
    }
    
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
