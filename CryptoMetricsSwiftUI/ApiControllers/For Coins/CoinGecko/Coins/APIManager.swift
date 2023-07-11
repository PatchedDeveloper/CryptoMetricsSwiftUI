//
//  APIManager.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//
import Foundation

class APIManager {
    private var coinData: [CoinDatum] = []
    static let shared = APIManager()
    
    let baseUrl = "https://api.coingecko.com/api/v3/coins/markets?"
    let params = "vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    var urlString: String {return "\(baseUrl)\(params)"}
    
    func getData(completion: @escaping ([CoinDatum]) -> Void) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coinData = try decoder.decode([CoinDatum].self, from: data)
                completion(coinData)
            } catch {
                print("Error decoding JSON: \(error)")
                completion([])
            }
        }
        
        task.resume()
    }
    
}




