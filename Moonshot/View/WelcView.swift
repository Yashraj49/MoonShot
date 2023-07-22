//
//  WelcView.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 19/07/23.
//

import SwiftUI

struct WelcView: View {
   
    @Environment(\.colorScheme) var colorScheme
    
    var gradientColors: [Color] {
        switch colorScheme {
        case .dark:
            return [.indigo, .gray]
        default:
            return [.teal, Color("TealC")]
        }
    }
    
    @State private var presentDetailsView: Bool = false
    @State private var itemSelection: Item = .firstGrid

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                LazyVGrid(columns: gridColumns, spacing: 20) {
                    ForEach(Item.allItems) { item in
                        ItemCard(itemX: item)
                            .onTapGesture {
                                itemSelection = item
                                presentDetailsView = true
                            }
                            .cornerRadius(25)
                            .shadow(radius:5)
                    }
                }
                Spacer()
            
                NavigationLink(destination: ContentView()) {
                    
                    Text("Explore More")
                        .font(.headline)
                        .foregroundColor(.white)
                        
                        
                        
                        
                }
                .buttonStyle(OrderButtonStyle()) // Apply your custom button style here
            }
                
            
            .sheet(isPresented: $presentDetailsView) {
                itemDetailView(itemY: $itemSelection)
            }
            .padding(.top)
            .padding()

            .navigationTitle("Moonshot")
            
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: gradientColors),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: Color.teal.opacity(0.45), radius: 10)
                    .ignoresSafeArea()
            )
            
            
        }
                
    }
}


private let gridColumns = [
    GridItem(.adaptive(minimum: 250, maximum: 500), spacing: 10),
    GridItem(.adaptive(minimum: 250, maximum: 500), spacing: 20)
]

struct WelcView_Previews: PreviewProvider {
    static var previews: some View {
        WelcView()
    }
}



struct OrderButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: configuration.trigger) {
            configuration.label
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .cornerRadius(15)
    }
}

