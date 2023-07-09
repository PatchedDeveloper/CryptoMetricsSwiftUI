//
//  TapBarView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            TokenView()
                .tabItem {
                    Image(systemName: "bitcoinsign.circle")
                    Text("Tokens")
                }
                .tag(1)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(2)
            OtherView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Other")
                }
                .tag(3)
        }
        .accentColor(.white)
        .onAppear {
            let customColor = UIColor(
                red: 13/255.0,
                green: 13/255.0,
                blue: 13/255.0,
                alpha: 1.0
            )
            UITabBar.appearance().backgroundColor = customColor
        }
    }
}


