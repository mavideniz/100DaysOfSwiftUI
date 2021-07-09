//
//  ContentView.swift
//  WeSplit
//
//  Created by Doğancan Mavideniz on 6.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10,15,20,25,5]
    
    var totalPerPerson: Double {
        
        guard let numberOfPeople = Double(numberOfPeople) else { return 0 }
            
            let tipSelection = Double(tipPercentages[tipPercentage])
            let orderAmount = Double(checkAmount) ?? 0

            let tipValue = orderAmount / 100 * tipSelection
            let grandTotal = orderAmount + tipValue
            let amountPerPerson = grandTotal / numberOfPeople
            return amountPerPerson
        
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue

        return grandTotal
    }
        
    var body: some View {
    
        NavigationView{
            Form{
    
            Section{
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                TextField("Number of people", text: $numberOfPeople){
                    
                }
                .keyboardType(.decimalPad)
            }
                Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip percentage", selection: $tipPercentage){
                    ForEach(0 ..< tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                    
                }
                Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
                Section(header: Text("Total Amount")){
                    Text("\(totalAmount, specifier: "%.2f")")
                    
                }
                
        }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
