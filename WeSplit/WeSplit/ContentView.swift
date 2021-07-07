//
//  ContentView.swift
//  WeSplit
//
//  Created by Doğancan Mavideniz on 6.07.2021.
//

import SwiftUI



struct ContentView: View {
    
    let students = ["Harry","Hermonia", "Ron"]
    @State private var selectedStudent = 0
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent){
                ForEach(0 ..< students.count){
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
