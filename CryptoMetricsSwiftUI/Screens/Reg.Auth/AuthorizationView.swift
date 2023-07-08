//
//  ProfileView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct AuthView: View {
    @State private var isLogoVisible = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isReg = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    @State private var isTabBar = false
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            ZStack{
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
            .padding(.top,50)
            Text("Authorization")
                .foregroundColor(.white)
                .font(Font.system(size: 20, weight: .bold))
                .padding(.top,10)// Установка жирного шрифта
            
            
            //TEXTFIEL EMAIL/pass
            VStack{
                HStack{
                    Image(systemName: "mail")
                                .foregroundColor(.white)
                                .padding(.leading, 10)

                    TextField("E-MAIL", text: $email)
                        .foregroundColor(.white) // Color of the entered text
                        .underline()
                        .accentColor(.white) // Color of the placeholder text
                        .colorScheme(.dark)
                    
                    
     
                }
                .cornerRadius(20)
                .padding(.vertical,30)
                .padding(.horizontal,1)
                //TEXTFIEL PASSWORD
                HStack{
                    Image(systemName: "lock.shield")
                                .foregroundColor(.white)
                                .padding(.leading, 10)
           
                    TextField("PASSWORD", text: $password)
                        .foregroundColor(.white) // Color of the entered text
                        .underline()
                        .accentColor(.white) // Color of the placeholder text
                        .colorScheme(.dark)
                    
     
                }
                .cornerRadius(20)
                .padding(.vertical,30)
                .padding(.horizontal,1)
                
            }
            .padding(.top,15)
            
            ZStack{

                
                Button {
                    print("User Authorized...")
                    AuthService.shared.signIn(email: email,
                                              password: password) { result  in
                        switch result{
                            
                        case .success(let user):
                            isTabBar.toggle()
                        case .failure(let error):
                            alertMessage = "Ошибка авторизации \(error.localizedDescription)!"
                            self.isShowAlert.toggle()
                        }
                    }
                } label: {
                    Text("SIGN IN")
                        .foregroundColor(.white)
                        .font(Font.system(size: 20, weight: .bold))
                }
                
                .frame(width: 254, height: 54)
                .background(
                    Color("BtnSignIn")
                        .blur(radius: 10)
                    // Apply the blur effect
                )
                .cornerRadius(30)
                .padding(.top, 30)
                .fullScreenCover(isPresented: $isTabBar) {
                    TabBarView()
                           }
            }
            
            //another metod authorized
            HStack{
                
                //google
                Button {
                    print("Auth with Google")
                    
                    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                            
                    let config = GIDConfiguration(clientID: clientID)

                    GIDSignIn.sharedInstance.configuration = config
                            
                    GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { signResult, error in
                                
                        if let error = error {
                           return
                        }
                                
                         guard let user = signResult?.user,
                               let idToken = user.idToken else { return }
                         
                         let accessToken = user.accessToken
                                
                         let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

                        // добавление в базу данных провайдера
                        Auth.auth().signIn(with: credential){ result,error in
                            
                            guard  error == nil else {
                                return
                            }
                            
                            isAuthenticated = true
                        }
                        // Use the credential to authenticate with Firebase

                    }
                } label: {
                    Image("google")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .fullScreenCover(isPresented: $isAuthenticated) {
                               TabBarView()
                           }
                Spacer()
               //Apple ID
                Button {
                    print("Login with apple")
                    
                    
                } label: {
                    Image("apple")
                        .resizable()
                        .frame(width: 40, height: 40)
                }



           
                
            }
            .frame(width: 150)
            .padding(.top,30)
            
            Text("DON’T HAVE ACCOUNT?")
                .foregroundColor(.gray  )
                .font(Font.system(size: 20, weight: .bold))
                .padding(.top,70)// Установка жирного шрифта
                
            Button {
                isReg.toggle()
            } label: {
                Text("Sign up")
                    .foregroundColor(.white)
                    .font(Font.system(size: 20, weight: .bold))
                
            }
            .fullScreenCover(isPresented: $isReg) {
                           RegView()
                       }
            .padding(.top,1)


            Spacer()


        }
        .alert( alertMessage,
                isPresented: $isShowAlert){
            Button{} label: {
                Text("OK")
            }
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
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation {
                    isLogoVisible.toggle()
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

