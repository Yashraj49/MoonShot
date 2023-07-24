//
//  SplashScreen.swift
//  Moonshot
//
//  Created by Yashraj jadhav on 24/07/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            WelcView()
        } else {
            VStack {
                VStack {
                    Image("apollo1")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                    
                        .foregroundColor(.red)
                    Text("MoonShoot")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(Color("ColorYZ").opacity(0.80))
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 2.2)) {
                        self.size = 11.9
                        self.opacity = 2.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
