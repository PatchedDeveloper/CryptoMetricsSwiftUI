//
//  LaunchScreen.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI


struct LaunchScreenView: View {
    @State private var isLogoVisible = true
    
    var body: some View {
        ZStack {
            Image("logoBlure")
                .resizable()
                .scaledToFit()
                .frame(width: 206, height: 190)
                .opacity(isLogoVisible ? 1 : 0)
                .animation(.easeInOut(duration: 0.5))
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 190, height: 190)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .onAppear {
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
