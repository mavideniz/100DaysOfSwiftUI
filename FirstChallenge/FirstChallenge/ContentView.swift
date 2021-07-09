//
//  ContentView.swift
//  FirstChallenge
//
//  Created by Doğancan Mavideniz on 9.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    let timeTypes = ["secs","mins","days","weeks"]
    
    @State var fromTimeType = 0
    @State var toTimeType = 0
    @State var updateValue = ""
    
    var resultValue : Double {
        var userInput = 0.0
        var result = 0.0

        if let updateValue = Double(updateValue) {
            switch fromTimeType {
            case 0:
                userInput = updateValue
            case 1:
                userInput = updateValue / 60
            case 2:
                userInput = updateValue / 86400
            case 3:
                userInput = updateValue / 604800
            default:
                userInput = 1
            }
        }
        
        
            switch toTimeType {
            case 1:
                userInput = userInput * 60
            case 2:
                userInput = userInput * 86400
            case 3:
                userInput = userInput * 604800
            default:
                result = 1
            }
            
        

        return Double(userInput)
    }
    var body: some View {
        NavigationView{
            Form{
                
                //MARK : BIRINCI BOLUM
                Section(header: Text("Which time type do you want to type?")){
                    
                Picker("",selection : $toTimeType ){
                    ForEach(0 ..< timeTypes.count){ item in
                        Text("\(timeTypes[item])")
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
            }
                
                // IKINCI BOLUM
                Section(header: Text("Which time type do you want to convert?")){
                    
                Picker("",selection : $fromTimeType ){
                    ForEach(0 ..< timeTypes.count){ item in
                        Text("\(timeTypes[item])")
                    }
                    
                
                }
                .pickerStyle(SegmentedPickerStyle())
            }
                
                Section(header: Text("Enter your value:")){
                    TextField("Value", text: $updateValue){
                        
                    }
                }

                    
                Section(header: Text("Result is :")){
                        Text("Result \(resultValue,specifier: "%0.2f")" )
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

