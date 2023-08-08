//
//  cardViewToken.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 09.07.2023.
//

import SwiftUI

struct CoinCardView: View {
    let coin: Coin
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: coin.icon)) { image in
                    image
                        .resizable()
                        .frame(width: 24, height: 24)
                } placeholder: {
                    // Placeholder image while loading
                    Color.gray
                        .frame(width: 24, height: 24)
                }
                .scaledToFit()
                .cornerRadius(10)
                
                Text(coin.name)
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .lineLimit(1)
                Spacer()
            }
            .padding()
            Spacer()
            HStack{
                VStack{
                    HStack{
                        ProcentPrice(procent: coin.priceChange1D ?? 0)
                            .padding(.trailing,65)
                        Spacer()
                    }
                
                    HStack{
                        Text("$"+formatNumber(Double(coin.price)))
                            .foregroundColor(.white)
                        Spacer()
                    }
 
                }
    
            }
            .padding(.horizontal)
            .padding(.top,-15)
            Spacer()
        }
        .frame(width: 150,height: 85)
        .background(Color("SecondColor"))
        .cornerRadius(10)
    
    }
}
