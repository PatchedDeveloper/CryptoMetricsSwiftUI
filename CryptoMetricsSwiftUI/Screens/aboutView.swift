//
//  aboutView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 09.07.2023.
//

//
//  aboutView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 09.07.2023.
//

import SwiftUI

struct aboutView: View {
    @State private var isLogoVisible = true
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            VStack{
                
                          Image(systemName: "hand.tap.fill")
                              .foregroundColor(.white)
                              .offset(y: yOffset)
                Text("Swipe down to hide")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
            }
            .padding(.top,80)
            
            ZStack {
                Image("logoBlure")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 190)
                    .opacity(isLogoVisible ? 1 : 0)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 190)
            }
            
            Text("CRYPTO METRICS")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 30))
            
            Text("Version 0.0.1 Build 1")
                .foregroundColor(.gray)
                .fontWeight(.medium)
                .font(.system(size: 15))
                .padding(.top, 5)
            
            HStack {
                Spacer()
                Text("Navigation")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.top, 20)
            
            VStack(spacing: 10) {
                // Share
                Button {
                    print("Press Share")
                } label: {
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                        Text("Поделиться Crypto Metrics")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                    }
                }
                .padding()
                
                // Road Map
                Button {
                    print("Press Road Map")
                } label: {
                    HStack{
                        Image(systemName: "map")
                            .foregroundColor(.white)
                        Text("Road Map")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                    }
                }
                .padding()
                
                // Оценить Crypto Metrics
                Button {
                    print("Press Rate Crypto Metrics")
                } label: {
                    HStack{
                        Image(systemName: "star")
                            .foregroundColor(.white)
                        Text("Оценить Crypto Metrics")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color("SecondColor"))
            .cornerRadius(10)
            .padding(.horizontal, 10)
            
            Spacer()

        }
        .padding(.top, 10)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .onAppear {
            let screenHeight = UIScreen.main.bounds.height/5
            yOffset = -screenHeight / 5
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                withAnimation(.easeInOut(duration: 2)) {
                    yOffset = isLogoVisible ? 0 : -screenHeight / 10
                    isLogoVisible.toggle()
                }
            }
        }
    }
}

struct aboutView_Previews: PreviewProvider {
    static var previews: some View {
        aboutView()
    }
}
