//
//  OtherView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI
import SafariServices

struct OtherView: View {
    @State private var isSwitchOn = true
    @State private var isLinkActiveDiscord = false
    @State private var isLinkActiveTelegram = false
    @State private var isLinkActiveTwitter = false
    var body: some View {
        VStack{
            HStack{
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.top,30)
            VStack{
                //language
                Button {
                    print("press language settings")
                } label: {
                    HStack{
                        Image(systemName: "globe")
                            .foregroundColor(.white)

                        Text("Language")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Spacer()
                        Text("English")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                //Landing
                Button {
                    print("press landing settings")
                } label: {
                    HStack{
                        Image(systemName: "iphone")
                            .foregroundColor(.white)

                        Text("Landing")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Spacer()
                        Text("Главная")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding()
              
                HStack{
                    Image(systemName: "moon.stars")
                        .foregroundColor(.white)

                    Text("Dark Mode")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                    Spacer()
                    HStack {
                        Text("On")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Toggle(isOn: $isSwitchOn) {
                            Text("Onf")
                        }
                        .labelsHidden()
                    }
                        .onChange(of: isSwitchOn) { newValue in
                            // Действия при изменении значения свитча
                            if newValue {
                                // Если свитч включен
                            } else {
                                // Если свитч выключен
                            }
                        }
                }
                .padding()

            }
            .frame(maxWidth: .infinity)
            .background(Color("SecondColor"))
            .cornerRadius(10)
            
            HStack{
                Text("Commynity")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.top,10)
            VStack{
                //language
                Button(action: {
                    isLinkActiveTelegram = true
                       }, label: {
                           HStack {
                               Image("twitter")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 20, height: 20)
                                   .foregroundColor(.gray)
                               Text("Twitter")
                                   .foregroundColor(.white)
                                   .font(.system(size: 16))
                               Spacer()
                               Image(systemName: "chevron.right")
                                   .foregroundColor(.white)
                           }
                       })
                       .padding()
                       .onTapGesture {
                           if let url = URL(string: "https://www.discord.com") {
                               UIApplication.shared.open(url)
                           }
                       }
                       .fullScreenCover(isPresented: $isLinkActiveTelegram, content: {
                           SafariView(url: URL(string: "https://t.me/Crypto_Metrics_app")!)
                       })
                //Landing
                Button(action: {
                    isLinkActiveTelegram = true
                       }, label: {
                           HStack {
                               Image("telegram")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 20, height: 20)
                                   .foregroundColor(.gray)
                               Text("Telegram News")
                                   .foregroundColor(.white)
                                   .font(.system(size: 16))
                               Spacer()
                               Image(systemName: "chevron.right")
                                   .foregroundColor(.white)
                           }
                       })
                       .padding()
                       .onTapGesture {
                           if let url = URL(string: "https://t.me/Crypto_Metrics_app") {
                               UIApplication.shared.open(url)
                           }
                       }
                       .fullScreenCover(isPresented: $isLinkActiveTelegram, content: {
                           SafariView(url: URL(string: "https://t.me/Crypto_Metrics_app")!)
                       })
              
                Button(action: {
                    isLinkActiveDiscord = true
                       }, label: {
                           HStack {
                               Image("discord")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 20, height: 20)
                                   .foregroundColor(.gray)
                               Text("Discord")
                                   .foregroundColor(.white)
                                   .font(.system(size: 16))
                               Spacer()
                               Image(systemName: "chevron.right")
                                   .foregroundColor(.white)
                           }
                       })
                       .padding()
                       .onTapGesture {
                           if let url = URL(string: "https://www.discord.com") {
                               UIApplication.shared.open(url)
                           }
                       }
                       .fullScreenCover(isPresented: $isLinkActiveDiscord, content: {
                           SafariView(url: URL(string: "https://discord.gg/ZHFDrQbRPU")!)
                       })
         

            }
            .frame(maxWidth: .infinity)
            .background(Color("SecondColor"))
            .cornerRadius(10)
            
            HStack{
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.top,10)
            VStack{
                //language
                Button {
                    print("open Converter")
                } label: {
                    HStack{
                        Image(systemName: "chevron.up.chevron.down")
                            .foregroundColor(.white)

                        Text("Converter")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                //Landing
                Button {
                    print("open CryptoNews")
                } label: {
                    HStack{
                        Image(systemName: "newspaper")
                            .foregroundColor(.white)

                        Text("Crypto News")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding()
      
            }
            .frame(maxWidth: .infinity)
            .background(Color("SecondColor"))
            .cornerRadius(10)
            
            VStack{
                //language
                Button {
                    print("open Converter")
                } label: {
                    HStack{
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)

                        Text("About the App")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color("SecondColor"))
            .cornerRadius(10)
            .padding(.top,40)
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("background"))
        
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}


