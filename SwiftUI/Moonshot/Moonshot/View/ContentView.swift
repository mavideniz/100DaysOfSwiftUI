//
//  ContentView.swift
//  Moonshot
//
//  Created by Doğancan Mavideniz on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowCrewNames = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.isShowCrewNames {
                            HStack{
                                Text("Crew Names: \(mission.CrewNames)")
                            
                        }
                        
                        }else{
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(leading: Toggle(isOn: $isShowCrewNames, label: {
                Text("CrewNames")
            }))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
