//
//  Mission.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 01/02/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String                                            // Nested struct 
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName : String {
        "Apollo \(id)"
    }
    
    var image : String {
        "apollo\(id)"
    }
    
    var formatedLaunchDate : String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
