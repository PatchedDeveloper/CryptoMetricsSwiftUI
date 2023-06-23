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
    let id: String
    let name: String
    let image: String
    let current_price: Double
    let sparkline_in_7d: SparklineIn7D
    
}


// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]
}
