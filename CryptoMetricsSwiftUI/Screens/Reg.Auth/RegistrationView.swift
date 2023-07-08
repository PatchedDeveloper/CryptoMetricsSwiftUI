//
//  ProfileView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI


struct RegView: View {
    @State private var isLogoVisible = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    @State private var isAuth = false
        
    
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
            .padding(.top,40)
            Text("Registration")
                .foregroundColor(.white)
                .font(Font.system(size: 20, weight: .bold))
                .padding(.top,10)
            
            Spacer()
            
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
                
                
                //TEXTFIEL PASSWORD
                HStack{
                    Image(systemName: "lock.shield")
                                .foregroundColor(.white)
                                .padding(.leading, 10)
           
                    TextField("REPEAT PASSWORD", text: $confirmPassword)
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
                    print("User Registration...")
                    
                    guard password == confirmPassword else {
                        self.alertMessage = "Пароли не совпадают!"
                        self.isShowAlert.toggle()
                        return
                    }
                    
                    AuthService.shared.signUp(email: email,
                                              password: password) { result in
                        switch result{
                            
                        case .success(let user):
                            alertMessage = "Вы зарегистрировались с почтой \(user.email!)! Войдите в свой аккаунт."
                            self.isShowAlert.toggle()
                            self.email = ""
                            self.password = ""
                            self.confirmPassword = ""
                        case .failure(let error):
                            alertMessage = "Ошибка регистрации \(error.localizedDescription)!"
                            self.isShowAlert.toggle()
                        }
                    }
                    
                    
                } label: {
                    Text("SIGN UP")
                        .foregroundColor(.white)
                        .font(Font.system(size: 20, weight: .bold))
                }
                .frame(width: 254, height: 54)
                .background(
                    Color("BtnSignUp")
                        .blur(radius: 10) // Apply the blur effect
                )
                .cornerRadius(30)
                .padding(.top, 30)
            }
            
            Text("YOU HAVE ACCOUNT?")
                .foregroundColor(.gray  )
                .font(Font.system(size: 20, weight: .bold))
                .padding(.top,70)// Установка жирного шрифта
                
            Button {
                isAuth.toggle()
            } label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .font(Font.system(size: 20, weight: .bold))
                
            }
            .fullScreenCover(isPresented: $isAuth) {
                           AuthView()
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

struct RegView_Previews: PreviewProvider {
    static var previews: some View {
        RegView()
    }
}
