//
//  AstronautView.swift
//  Moonshot
//
//  Created by Doğancan Mavideniz on 21.09.2021.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let missionsFlown: [String]

    init(astronaut: Astronaut) {
        self.astronaut = astronaut

        var matches = [String]()

        for mission in missions {
            if mission.crew.contains(where: { $0.name == astronaut.id }) {
                matches.append("\(mission.displayName)")
            }
        }
        self.missionsFlown = matches
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.missionsFlown, id: \.self) { mission in
                        VStack {
                            Text(mission.description)
                                .font(.headline)
                        }
                    }
                    
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}
struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
