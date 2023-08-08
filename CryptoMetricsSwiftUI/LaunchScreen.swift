//
//  LaunchScreen.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI


struct LaunchScreenView: View {
    @State private var isLogoVisible = true
    @State private var yOffset: CGFloat = -200
    
    var body: some View {
        ZStack {
            Image("logoBlure")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
                .opacity(isLogoVisible ? 1 : 0)
                .offset(y: yOffset)
            
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .offset(y: yOffset)
          
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        
        .onAppear {
            let screenHeight = UIScreen.main.bounds.height
            let screenWidth = UIScreen.main.bounds.width
            let imageHeight = 190
            let imageWidth = 190
            let xOffset = (screenWidth - CGFloat(imageWidth)) / 2
            let yOffset = (screenHeight - CGFloat(imageHeight)) / 2 - screenHeight / 2
            
            withAnimation(.easeInOut(duration: 0.5)) {
                self.yOffset = yOffset
            }
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation {
                    isLogoVisible.toggle()
                }
            }
        }
    }
}


struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
