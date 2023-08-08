//
//  ProfileView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI


struct ProfileView: View {
    
    @State var isAvatarAlertPresented = false
    
    var body: some View {
        VStack {
            
            //Profile info
            HStack(spacing: 16){
                Image("user")
                    .resizable()
                    .frame(width: 80,height: 80)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvatarAlertPresented.toggle()
                    }
                    .confirmationDialog("What to use?", isPresented: $isAvatarAlertPresented) {
                        
                        Button {
                            print("Library")
                        } label: {
                            Text("Library")
                        }

                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("Camera")
                        }
                    }
                
                VStack(alignment: .leading, spacing: 12){
                    Text("USER NAME")
                        .foregroundColor(.white)
                        .bold()
                    
                    Text("Xetokky@gmail.com")
                        .foregroundColor(.white)
                }
                
            }
            .padding(.top,10)
            
            Spacer()
             
            Button {
                print("exit")
            } label: {
                Text("Exit")
                    .padding()
                    .foregroundColor(.white)
                    .padding(.horizontal,60)
                    .background(.red)
                    .cornerRadius(30)
            }.padding()


            
     
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
     
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
