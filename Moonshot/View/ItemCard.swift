//
//  ItemCard.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 20/07/23.
//

import SwiftUI

struct ItemCard: View {
    private let itemX : Item
    
    var body: some View {
        ZStack {
            itemX.backgroundColor
            VStack{
                Spacer()
                itemX.icon.image
                    .resizable()
                    .frame(width:80, height: 80, alignment: .center)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))
                HStack {
                    Text(itemX.localizedName.capitalized)
                     //   .font(.)
                        .kerning(0)
                        .textCase(.uppercase)
                    Spacer()
                    Image(systemName: "arrow.up.forward.app.fill")
                        .foregroundColor(.secondary)
                }.padding(15)
            }
        }
        .cornerRadius(10.0)
        .contentShape(Capsule())
    }
    init(itemX: Item) {
        self.itemX = itemX
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(itemX: .firstGrid)
    }
}
