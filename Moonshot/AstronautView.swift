//
//  AstronautView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 03/02/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                
                Text(astronaut.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.gray, Color.black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }

}
 
struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
