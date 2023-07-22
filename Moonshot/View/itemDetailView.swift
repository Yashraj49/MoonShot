//
//  itemDetailView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 20/07/23.
//

import SwiftUI

struct itemDetailView: View {
    @Binding var itemY: Item
    
    private let backgroundOpacity: Double = 0.2

    var body: some View {
        ScrollView {
            VStack {
                HeaderView(itemZ: itemY)
                    .font(.title)
                    .padding()
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                Text(itemY.description)
                    .foregroundColor(Color("ColorEx"))
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.white.opacity(backgroundOpacity))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.gray, Color.blue, Color.purple, Color.gray]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .edgesIgnoringSafeArea(.all)
    }
}



struct itemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        itemDetailView(itemY: .constant(.firstGrid))
    }
}

