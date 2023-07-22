//
//  HeaderView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 20/07/23.
//

import SwiftUI

struct HeaderView : View{
    
     let itemZ : Item
    
    var body: some View {
        Spacer()
        itemZ.icon.image
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 300)
            .cornerRadius(150)
            .shadow(radius: 10)
        
            
        Text(itemZ.localizedName.capitalized)
            .font(.system(size: 20))
            .padding([.leading, .trailing], 20)
            .padding([.bottom], 20)
        
        Text("Welcome to \(itemZ.localizedName) section")
            .padding([.leading, .trailing], 20)
        
        
        
    }
    init(itemZ: Item) {
        self.itemZ = itemZ
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(itemZ: .firstGrid)
    }
}
