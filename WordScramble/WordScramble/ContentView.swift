//
//  ContentView.swift
//  WordScramble
//
//  Created by Doğancan Mavideniz on 31.07.2021.
//

import SwiftUI

let people = ["dogancan", "ayşe", "ahmet", "fatma"]

let input = "a b c"
let letters = input.components(separatedBy:  " ")

struct ContentView: View {
    var body: some View {
        
        List(people, id: \.self){
        
            Text("\($0)")
        
        }
        
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
