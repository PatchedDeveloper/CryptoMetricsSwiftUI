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
            
            //Profile info
            HStack(spacing: 16){
                Image("user")
                    .resizable()
                    .frame(width: 80,height: 80)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 12){
                    Text("USER NAME")
                        .foregroundColor(.white)
                        .bold()
                    
                    Text("Xetokky@gmail.com")
                        .foregroundColor(.white)
                }
                
            }
            
            
            
     
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
