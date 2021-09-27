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
    @State private var randomNumber = Int.random(in: 0 ... 10)
    @State private var answer = 0
    @State private var answers = [Int]()
    @State private var userScore = 0
   

    var body: some View {
        
        ZStack{
                Color.yellow
                    .ignoresSafeArea()
            if isGameActive {
                
                Group{
                
                        VStack{
                            Text("How much is \(multiTable) * \(randomNumber)")
                            
                            Text("User Score : \(userScore)")
                            
                            ForEach(0..<(answers.count) , id:\.self) { num in
                                Text("\(answers[num])")
                                    .onTapGesture {
                                        if answers[num] == answer {
                                            userScore += 1
                                        }
                                    }
                            }.onAppear {
                                answers.shuffle()
                            }
                            
                            Button("Go Back"){
                                isGameActive.toggle()
                            }
                            
                        }
                    
                    }
                    
                
                
                
            }else{
                
            
            Group{
            VStack{
                //İlk sayfa
                Text("🧮")
                    .font(.system(size: 200))
                    .padding()
                Text("Multiplication Practise")
                    .bold()
                    .font(.system(size: 25))
                    .padding()
                    
                
                
                Text("Which number do you want for practise?")
                Picker("", selection: $multiTable){
                    ForEach(allMultiplicationTables, id: \.self) {
                    Text("\($0)")
                    }
                }
                .border(Color.red)
                .padding(20)
                .onChange(of: multiTable, perform: { val in
                    randomNumber = Int.random(in: 0 ... 10)
                    testFunc()
                })
                .pickerStyle(SegmentedPickerStyle())
                
                
                Text("How many question do you want?")
                    Picker("", selection: $howManyQuest){
                        ForEach(QuestionNumber, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .frame(width: 200)
                    .border(Color.red)
                    .padding(20)
                    .pickerStyle(SegmentedPickerStyle())
                
                Button("Start Game"){
                    isGameActive.toggle()
                    createAnswersArray()
                    //when game start
                    
                }
            
            }
            }

        }
    }
    }
    
    func testFunc(){
        answer = multiTable * randomNumber
        return
    }
    
    func createAnswersArray() {
        self.answers.removeAll()
        let answer1 = multiTable * (randomNumber + 1)
        let answer2 = multiTable * (randomNumber + 2)
        let answer3 =  multiTable * (randomNumber - 1)
        self.answers.append(answer1)
        self.answers.append(answer2)
        self.answers.append(answer3)
        self.answers.append(answer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
