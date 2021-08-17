//
//  ContentView.swift
//  EducationGame
//
//  Created by Doğancan Mavideniz on 17.08.2021.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isGameActive = false
    @State private var multiTable = 0
    @State private var howManyQuest = 0
    let allMultiplicationTables = Range(1...12)
    let QuestionNumber = [3,5,7]

    var body: some View {
        
        
        if isGameActive {
            Group{
                VStack{
                    Text("test")
                    
                    Button("Go Back"){
                        isGameActive.toggle()
                    }
                    
                }
            }
            
            
            
        }else{
            
        
        Group{
        VStack{
            
            //İlk sayfa
            Text("Hangi çarpım tablosunu kullanmak istersin?")
            Picker("İstediğin çarpım tablosunu seç", selection: $multiTable){
                ForEach(allMultiplicationTables, id: \.self) {
                Text("\($0)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            Text("Kaç soru sorulmasını istersin?")
                Picker("soru sayısı", selection: $howManyQuest){
                    ForEach(QuestionNumber, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            
            Button("Start Game"){
                isGameActive.toggle()
                
                //when game start
                
            }
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
