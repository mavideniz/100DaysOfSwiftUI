//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Doğancan Mavideniz on 10.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
 
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var rotationAmount = 0.0


    var body: some View {
        ZStack{
            Color.secondary.edgesIgnoringSafeArea(.all)

        

        VStack(spacing: 30){
            
        
        VStack {
            Text("Tap the flag of")
                .foregroundColor(.white)

            Text(countries[correctAnswer])
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.black)
            
                
            
        }
        ForEach(0 ..< 3) { number in
            
            Button(action: {
                self.flagTapped(number)
                
               // flag was tapped
            }
            ) {
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                        .opacity(self.showingScore && number != self.correctAnswer ? 0.25 : 1.0)
                
            }.rotation3DEffect(.degrees(number == self.correctAnswer ? self.rotationAmount : 0), axis: (x: 0, y: 1, z: 0))
            
        }
       
            Text("Your score is: \(userScore)").bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            Spacer()
        }
            
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "You are correct!"
            userScore += 1
            withAnimation(.spring()) {
                            self.rotationAmount += 360.0
                        }
           
        }
        else{
            scoreTitle = "Wrong!, Correct anwser is \(countries[correctAnswer]) "
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
       
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
