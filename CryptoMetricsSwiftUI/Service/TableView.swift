//
//  TableView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 23.06.2023.
//

import SwiftUI

struct TableView: View {
    @State private var coinData: [CoinDatum] = []
    var body: some View {
        List(coinData, id: \.id) { coin in
            Text(coin.name)
        }
    }
}

////struct TableView_Previews: PreviewProvider {
////    static var previews: some View {
////        let sampleCoinData = [
////            CoinDatum(id: "bitcoin", symbol: "BTC", name: "Bitcoin", image: "bitcoin", currentPrice: 34000, sparklineIn7D: SparklineIn7D(price: []), priceChangePercentage24H: 5.6),
////            CoinDatum(id: "ethereum", symbol: "ETH", name: "Ethereum", image: "ethereum", currentPrice: 2000, sparklineIn7D: SparklineIn7D(price: []), priceChangePercentage24H: -3.2),
////            CoinDatum(id: "litecoin", symbol: "LTC", name: "Litecoin", image: "litecoin", currentPrice: 150, sparklineIn7D: SparklineIn7D(price: []), priceChangePercentage24H: 2.1)
////        ]
////
////        TableView(coinData: sampleCoinData)
////    }
////}
