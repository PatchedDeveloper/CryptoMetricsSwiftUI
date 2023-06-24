//
//  CoinData.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//

import Foundation

typealias CoinData = [CoinDatum]

// MARK: - CoinDatum
struct CoinDatum: Identifiable,Codable {
    let id, name: String
    let symbol: String
    let image: String
    let market_cap_rank: Int
    let market_cap: Int
    let total_volume,high_24h,low_24h,market_cap_change_percentage_24h,total_supply,max_supply: Double?
    let currentPrice: Double
    let sparklineIn7D: SparklineIn7D
    let priceChangePercentage24H: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
        case symbol
        case market_cap_rank,market_cap
        case total_volume,high_24h,low_24h,market_cap_change_percentage_24h,total_supply,max_supply
        case currentPrice = "current_price"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
}


// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]
}

