//
//  cardViewToken.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 09.07.2023.
//

import SwiftUI

struct CoinCardView: View {
    @State private var graphData: [[TimeInterval: Double]] = []
    @State private var graphdays = 1
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
                    ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                    Text("$"+formatNumber(Double(coin.currentPrice)))
                        .foregroundColor(.white)
                }
                
            }
            .padding(.horizontal)
            .padding(.top,-15)
            Spacer()
        }
        .frame(width: 150,height: 85)
        .background(Color("SecondColor"))
        .cornerRadius(10)
        .onAppear {
            fetchChartData()
        }
    }
    
    func fetchChartData() {
        GraphAPIManager.shared.getBitcoinChartData(nametoken: coin.id,days: String(graphdays)) { result in
            switch result {
            case .success(let chartData):
                let convertedData = chartData.prices.map { [$0[0]: $0[1]] }
                graphData = convertedData
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
