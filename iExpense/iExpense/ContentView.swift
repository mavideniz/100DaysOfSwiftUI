//
//  ContentView.swift
//  iExpense
//
//  Created by Doğancan Mavideniz on 29.08.2021.
//

import SwiftUI



struct expenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [expenseItem]() {
        didSet {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "Items")
                }
            }
        
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([expenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
    
    
}



struct ContentView: View {
    
    @State private var showingAddExpense = false
    
    
    @ObservedObject var expenses = Expenses()
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                            
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(item.amount <= 100 ? .green : item.amount > 100 && item.amount < 1000 ? .orange : .red)
                    }
                    
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarTitle("iExpense")
            .toolbar{
                EditButton()
            }
            .navigationBarItems(leading:
            Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
            
            
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: self.expenses)
            }
            
            
            }
        
        
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
