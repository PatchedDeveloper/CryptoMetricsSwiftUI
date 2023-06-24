//
//  CoinDetailView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 24.06.2023.
//

import SwiftUI

struct CoinDetailView: View {
    let coin: CoinDatum
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    backButton
                        .foregroundColor(.white)
                    Spacer()
                    Text(coin.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    HStack{
                        Text(coin.symbol)
                            .font(.headline)
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                        
                        if let imageURL = URL(string: coin.image) {
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            } placeholder: {
                                // Placeholder image while loading
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding()
                
                Text("Name: \(coin.name)")
                    .padding()
                    .foregroundColor(.white)
                
                Text("Symbol: \(coin.symbol)")
                    .padding()
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("background")) // Set the desired background color here
        }
        .navigationBarHidden(true)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
            Text("BACK")
                .foregroundColor(.white)
        }
    }
}
