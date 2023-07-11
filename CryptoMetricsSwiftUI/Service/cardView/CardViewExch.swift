//
//  cardViewExch.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 11.07.2023.
//

import SwiftUI

struct cardViewExch: View {
    let exch: ModelExchElement
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: exch.image)) { image in
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
                
                Text(exch.name)
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .lineLimit(1)
                Spacer()
            }
            .padding(.top,10)
            .padding(.horizontal)
            HStack{
                Text("Trade Volume")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                Spacer()
                Text("Trust")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            HStack{
                Text("$"+formatNumber(Double(exch.tradeVolume24HBtc)))
                    .foregroundColor(.white)
                
                Spacer()
                if exch.trustScore <= 10 && exch.trustScore > 9 {
                    Text(String(exch.trustScore))
                        .foregroundColor(Color("green"))
                }
                else if exch.trustScore <= 9 && exch.trustScore > 5 {
                    Text(String(exch.trustScore))
                        .foregroundColor(Color("yellow"))
                }
                else{
                    Text(String(exch.trustScore))
                        .foregroundColor(Color("red"))
                }
            }
            .padding(.horizontal)
            .padding(.bottom,15)
      
        }
        .frame(width: 150,height: 85)
        .background(Color("SecondColor"))
        .cornerRadius(10)
    }
}

struct cardViewExch_Previews: PreviewProvider {
    static var previews: some View {
        cardViewExch(exch: ModelExchElement(
            id: "1",
            name: "Example Exchange",
            yearEstablished: 2022,
            image: "exchange",
            trustScore: 5,
            tradeVolume24HBtc: 1000.0
        ))
    }
}

