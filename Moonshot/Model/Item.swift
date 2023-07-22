//
//  ItemView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 19/07/23.
//

import SwiftUI

let des = Descriptions()

struct Item : Hashable , Identifiable {
    
    
    
    struct Icon : Identifiable , Hashable {
        let id : String
        let image : Image
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        init(name : String) {
            id = name
            image = Image(name)
            
        }
        
    }
      
    let icon : Icon
    let id = UUID()
    let backgroundColor : Color
    let localizedName: String
    let description : String
        
        
    static let firstGrid : Item = Item( icon: Icon(name: "Grid1"), backgroundColor: .backgroundBlue, localizedName: "Missions Timeline", description: des.apolloMissionsTimeline
                                        )
    static let secondGrid : Item = Item( icon: Icon(name: "Grid22"), backgroundColor: .backgroundGreen, localizedName: "Notable Astronauts", description: des.notableAstronautsInfo
                        
                                         
                                        
                                        )
    static let thirdGrid : Item = Item( icon: Icon(name: "Grid33"), backgroundColor: .backgroundYellow, localizedName: " Innovations", description: des.technologicalInnovationsInfo
                                        )
    static let fourthGrid : Item = Item( icon: Icon(name: "Grid44"), backgroundColor: .backgroundOrange, localizedName: "Fun Facts", description: des.funFactsAndTrivia
                                        )
    
    static let allItems : [Item] = [
    
        .firstGrid,
        .secondGrid,
        .thirdGrid,
        .fourthGrid
       
    ]
    
}




extension Color {
    
   
    // Background colors
    static let backgroundBlue: Color = Color("BackgroundBlue", bundle: .main)
    static let backgroundGreen: Color = Color("BackgroundGreen", bundle: .main)
    static let backgroundOrange: Color = Color("BackgroundOrange", bundle: .main)
    static let backgroundYellow: Color = Color("BackgroundYellow", bundle: .main)
}

extension Font {
    static let slogan: Font = .system(size: 40, weight: .bold)
    static let cardTitle: Font = .system(size: 15, weight: .bold)
    static let cardIcon: Font = .system(size: 80, weight: .bold)
}


