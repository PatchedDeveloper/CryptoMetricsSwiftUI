//
//  ContentView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//
//
//

import SwiftUI

struct HomeView: View {
    @State private var coinData: [Coin] = []
    @State private var isCoinView = false
    @ObservedObject var apiManagerCoinStats = APIManagerCoinStats.shared
    
    
    var body: some View {
        //appbar
        VStack {
            HStack {
               Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("Crypto Metrics")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Spacer()
                Button {
                    print("enter the subscription view")
                } label: {
                    Image("diamond")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 30, height: 30)
                }
                .padding(.horizontal,5)
                
                Button {
                    print("enter the subscription view")
                } label: {
                   Text("USD")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal,5)
                
                Button {
                    print("search")
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal,5)

                

            }
            .underline()
            .foregroundColor(.gray)
            .padding()
            
            ScrollView(showsIndicators: false){
                HStack{
                    Text("Top 10 Coins")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                    Button {
                      //Переход на коин вью
                    } label: {
                        Text("See All>")
                            .foregroundColor(Color("BtnSignUp"))
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                    }
                 

                }
                .padding(.horizontal)
                
                //MARK: TOP COINS
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(apiManagerCoinStats.coinData.coins) { coin in
                            CoinCardView(coin: coin)
                        }
                    }
                    .padding(.horizontal)
                }

                
                
                HStack{
                    Text("Top Exchanges")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                    Button {
                        //сделать переход на коин вью
                    } label: {
                        Text("See All>")
                            .foregroundColor(Color("BtnSignUp"))
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                    }
                    

                }
                .padding(.horizontal)
                .padding(.top,15)

              
                Image("line")
                      .resizable()
                      .padding(.horizontal)
                      .padding(.top,15)
                
            }
            
        Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .onAppear {
            apiManagerCoinStats.fetchData()
            }
        
    }
    

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


