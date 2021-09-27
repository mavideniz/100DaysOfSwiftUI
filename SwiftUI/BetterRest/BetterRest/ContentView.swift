//
//  ContentView.swift
//  BetterRest
//
//  Created by Doğancan Mavideniz on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    
    

    
    var body: some View {
        NavigationView{
            Form{
                
                Section(header: Text("When do you want to wake up?").font(.headline)){
                        DatePicker("Enter the time", selection: $wakeUp,displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Desired amount of sleep").font(.subheadline)){
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake").font(.subheadline)){
                    Stepper(value: $coffeeAmount, in: 1...20){
                        if coffeeAmount == 1{
                            Text("1 cup")
                        }
                        else{
                            Text("\(coffeeAmount) cup")
                        }
                    }
                }
                
                Section(header: Text("Recommended rest time").font(.subheadline)){
                    Text("\(calculatedBedTime)")
                        .font(.headline)
                }
            }
            .navigationBarTitle("BetterRest")

        }
        
    }
    
    static var defaultWakeTime: Date {
            var components = DateComponents()
            components.hour = 7
            components.minute = 0
            return Calendar.current.date(from: components) ?? Date()
        }

        
        var calculatedBedTime: String {
            let model = SleepCalculator()

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            var message: String
            do {
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

                let sleepTime = wakeUp - prediction.actualSleep

                let formatter = DateFormatter()
                formatter.timeStyle = .short

                message = formatter.string(from: sleepTime)
            }
            catch {
                message = "Error calculating bedtime"
            }

            return message
        }
    }
    
    
    





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
