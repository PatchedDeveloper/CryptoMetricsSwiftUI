//
//  ProfileView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        VStack {
            Text("THIS SCREEN PROFILE")
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
     
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
