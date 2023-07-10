//
//  CoinModel.swift
//  Testovoe_Hummer
//
//  Created by Danila Kardashevkii on 10.07.2023.
//
import Foundation

// MARK: - CoinStatsModelToken
struct CoinStatsModelToken: Codable {
    let coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable,Identifiable {
    let id: String
    let icon: String
    let name, symbol: String
    let rank: Int
    let price, priceBtc, volume, marketCap: Double
    let availableSupply, totalSupply: Int
    let priceChange1H, priceChange1D, priceChange1W: Double
    let websiteURL: String
    let twitterURL: String
    let exp: [String]
    let contractAddress: String?
    let decimals: Int?

    enum CodingKeys: String, CodingKey {
        case id, icon, name, symbol, rank, price, priceBtc, volume, marketCap, availableSupply, totalSupply
        case priceChange1H = "priceChange1h"
        case priceChange1D = "priceChange1d"
        case priceChange1W = "priceChange1w"
        case websiteURL = "websiteUrl"
        case twitterURL = "twitterUrl"
        case exp, contractAddress, decimals
    }
}
