//
//  cardViewToken.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 09.07.2023.
//

import SwiftUI

struct CoinCardView: View {
    let coin: CoinDatum
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: coin.image)) { image in
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
                        ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                            .padding(.trailing,65)
                        Spacer()
                    }
                
                    HStack{
                        Text("$"+formatNumber(Double(coin.currentPrice)))
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

struct CoinCardView_Previews: PreviewProvider {
    static var previews: some View {
        CoinCardView(coin: CoinDatum(
            id: "bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            image: "bitcoin_image_url",
            market_cap_rank: 1,
            market_cap: 1000000000,
            total_volume: 5000000,
            high_24h: 60000,
            low_24h: 40000,
            market_cap_change_percentage_24h: 2.5,
            total_supply: 21000000,
            max_supply: 21000000,
            price_change_24h: 2000,
            circulating_supply: 18000000,
            currentPrice: 50000,
            sparklineIn7D: SparklineIn7D(price: [1,2,3,4]),
            priceChangePercentage24H: 5))
            .previewLayout(.fixed(width: 200, height: 120)) // Задайте нужные размеры превью
    }
}
