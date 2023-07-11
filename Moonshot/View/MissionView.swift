//
//  MissionView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 03/02/23.
//

import SwiftUI

struct MissionView: View {
    @Environment(\.colorScheme) var colorScheme
    let crew: [CrewMember]

    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission

    var gradientColors: [Color] {
        switch colorScheme {
        case .dark:
            return [.teal, .black]
        default:
            return [.teal, .brown]
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {

                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)

                    Text(mission.formatedLaunchDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    VStack(alignment: .leading, spacing: 20) {
                        Divider().background(Color.gray)

                        Text("Mission Highlights")
                            .font(.title.bold())
                            .foregroundColor(.white)

                        Text(mission.description)
                            .foregroundColor(.white)

                        Divider().background(Color.gray).padding(.vertical)

                        Text("Crew")
                            .font(.title.bold())
                            .foregroundColor(.white)
                    }

                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: gradientColors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: Color.teal.opacity(0.45), radius: 10)
                            .shadow(radius: 4)
                    )

                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .clipShape(Circle())

                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text(crewMember.role).fixedSize()
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)

        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map() { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut : astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    }
   
struct HorizontalCrewScrollView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
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
                                Text(crewMember.role).fixedSize()
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}




struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
