//
//  ContentView.swift
//  BetterRest
//
//  Created by Doğancan Mavideniz on 16.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)


            .labelsHidden()
    
            
            
        
            Stepper(value: $sleepAmount, in: 4...12, step: 0.50){
            Text("\(sleepAmount, specifier: "%.2f") hours")
        }
        }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
