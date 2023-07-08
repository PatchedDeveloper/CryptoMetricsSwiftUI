//
//  CryptoMetricsSwiftUIApp.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn


let screen = UIScreen.main.bounds

@main
struct CryptoMetricsSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate : AppDelegate
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
                AuthView()
            }
        }
    }
    class AppDelegate: NSObject,UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            
            print("firebase configure ok")
            return true
        }
        
        func application(_ app: UIApplication,
                         open url: URL,
                         options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
          return GIDSignIn.sharedInstance.handle(url)
        }
    }
}
