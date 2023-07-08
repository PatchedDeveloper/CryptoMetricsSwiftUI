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
    @State private var coinData: [CoinDatum] = [] // Assuming this array is populated with API data
    
    var body: some View {
        VStack {
            HStack {
                Text("Top Coins")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                
                Spacer()
                
                Button {
                    // Action for the button
                } label: {
                    Text("See All >")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                }
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<min(coinData.count, 10)) { index in
                        CoinCard(coin: coinData[index]) // Pass the coin data to the CoinCard view
                    }
                    .padding()
                }
                .background(Color("SecondColor")) // Move the .background() modifier here
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .padding(.horizontal)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
    }
}

struct CoinCard: View {
    var coin: CoinDatum
    
    var body: some View {
        VStack {
            // Customize the appearance of the coin card as needed
            Text(coin.name)
                .foregroundColor(.white)
                .font(.title)
                .padding()
            
            // Display additional data for the coin, such as price, market cap, etc.
            Text("Price: \(coin.currentPrice)")
                .foregroundColor(.white)
                .font(.subheadline)
            
            // Add more views to display other coin data
            
            Spacer()
        }
        .frame(width: 200, height: 150)
        .background(Color.gray)
        .cornerRadius(10)
        .padding()
    }
}


