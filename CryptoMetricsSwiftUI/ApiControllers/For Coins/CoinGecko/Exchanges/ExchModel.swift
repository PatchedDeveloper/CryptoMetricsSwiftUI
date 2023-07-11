//
//  CoinData.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//

import Foundation

typealias ModelExch = [ModelExchElement]
// MARK: - ModelExchElement
struct ModelExchElement: Codable,Identifiable {
let id, name: String
let yearEstablished: Int?
let image: String
let trustScore: Int
let tradeVolume24HBtc: Double

enum CodingKeys: String, CodingKey {
case id, name
case yearEstablished = "year_established"
case image
case trustScore = "trust_score"
case tradeVolume24HBtc = "trade_volume_24h_btc"
}
}



