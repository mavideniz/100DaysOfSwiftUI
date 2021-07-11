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
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)


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
            }) {
                Image(self.countries[number])
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    .shadow(color: .black, radius: 2)
            }
        }
            Spacer()
        }
            
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "You are correct!"
        }
        else{
            scoreTitle = "Wrong! :("
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
