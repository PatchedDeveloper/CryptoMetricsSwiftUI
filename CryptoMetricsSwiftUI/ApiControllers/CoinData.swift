//
//  CoinData.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//

import Foundation

typealias CoinData = [CoinDatum]

// MARK: - CoinDatum
struct CoinDatum: Codable {
    let id, name: String
    let symbol: String
    let image: String
    let currentPrice: Double
    let sparklineIn7D: SparklineIn7D
    let priceChangePercentage24H: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
        case symbol
        case currentPrice = "current_price"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
}


// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]
}

