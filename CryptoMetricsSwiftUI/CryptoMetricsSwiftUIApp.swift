//
//  CryptoMetricsSwiftUIApp.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI

@main
struct CryptoMetricsSwiftUIApp: App {
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            showLaunchScreen = false
                        }
                    }
                
            } else {
                TabBarView()
            }
        }
    }
}
