//
//  ContentView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 30/01/23.
//

import SwiftUI

struct ContentView: View {

    enum LayoutType: String, CaseIterable {
        case grid = "Grid"
        case list = "List"
    }
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var layout: LayoutType = .grid
    
    var body: some View {
        VStack {
            

            
            Group {
                if layout == .grid {
                    // Show missions as a grid
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(missions) { mission in
                                NavigationLink(
                                    destination: MissionView(mission: mission, astronauts: astronauts),
                                    label: {
                                        MissionGridItemView(mission: mission)
                                        
                                        
                                    }
                                        
                                )
                            }
                        }
                            
                        .padding([.horizontal, .bottom])
                    }
                } else {
                    // Show missions as a list
                    List(missions) { mission in
                        NavigationLink(
                            destination: MissionView(mission: mission, astronauts: astronauts),
                            label: {
                                MissionListItemView(mission: mission)
                            }
                        )
                    }
                    .listStyle(.plain)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker(selection: $layout, label: Text("Layout"), content: {
                        ForEach(LayoutType.allCases, id: \.self) { layoutType in
                            Text(layoutType.rawValue)
                        }
                    })
                    .pickerStyle(.segmented)
                }
            }
        }
        
        
        
      //  .background(.darkBackground)
        //.preferredColorScheme(colorScheme == .light ? .light : .dark)
    }
        
    
    
}

struct MissionCrewView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .cornerRadius(1)
                .padding(.vertical)
            
            Text("Crew")
                .font(.title.bold())
                .foregroundColor(.white)
                .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )

                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 10)
        )
    }
}


struct MissionGridItemView: View {
    let mission: Mission

    var body: some View {
        LazyVStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 110)
                .padding()

            LazyVStack(spacing: 5) {
                Text(mission.displayName)
                    .font(.title2)
                    .foregroundColor(.white)
                Text(mission.formatedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.gray.opacity(16.5))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom))
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .stroke(Color.white, lineWidth: 2)
        )
        .shadow(color: Color.blue, radius: 5, x: 0, y: 5)
        .navigationBarTitle(Text("Missions"))
    }
}


struct MissionListItemView: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                Text(mission.formatedLaunchDate)
                    .font(.subheadline)
            }
        }
    }
}

        



struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

