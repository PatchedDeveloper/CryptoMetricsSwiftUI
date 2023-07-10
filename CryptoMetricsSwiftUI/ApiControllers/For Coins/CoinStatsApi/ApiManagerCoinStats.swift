//
//  APIManager.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//
import Foundation

class APIManagerCoinStats: ObservableObject {
    @Published var coinData: CoinStatsModelToken = CoinStatsModelToken(coins: [])
    static let shared = APIManagerCoinStats()
    
    func fetchData() {
        let url = URL(string: "https://api.coinstats.app/public/v1/coins?skip=0&limit=10&currency=USD")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coinStatsModelToken = try decoder.decode(CoinStatsModelToken.self, from: data)
                DispatchQueue.main.async {
                    self?.coinData = coinStatsModelToken
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
