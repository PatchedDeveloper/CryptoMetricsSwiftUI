//
//  CoinConverter.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 12.07.2023.
//

import SwiftUI

struct CoinConverter: View {
    @ObservedObject var apiManager = APIManagerCoinStats.shared
    @State private var selectedCoin: Coin?
    @State private var isAddingCoin = false

    var body: some View {
        VStack{
            //appbar
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                    Text("Back")
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack{
                    Text("Converter")
                        .foregroundColor(.white)
                }
                .padding(.leading,15)
                .padding(.trailing,15)
                .background(.gray)
                .opacity(0.5)
                .cornerRadius(10)
                Spacer()
                Button(action: {
                    isAddingCoin = true
                }) {
                    Text("Add")
                        .foregroundColor(.gray)
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                }

            }
            .padding()
            
            Image("line")
                .frame(width: .infinity)
            
            List {
                ForEach(apiManager.coinData.coins) { coin in
                    Text(coin.name)
                        .onTapGesture {
                            selectedCoin = coin
                            isAddingCoin = true
                        }
                }
            }
            
         Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .sheet(isPresented: $isAddingCoin, content: {
            if let selectedCoin = selectedCoin {
                Text("Adding \(selectedCoin.name)")
                    // Add logic to handle adding the selected coin
            }
        })
        .onAppear {
            apiManager.fetchData()
        }
    }
}

struct CoinConverter_Previews: PreviewProvider {
    static var previews: some View {
        CoinConverter()
    }
}
