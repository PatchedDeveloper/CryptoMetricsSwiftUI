//
//  APIManager.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//
import Foundation

class APIManagerCoinStatsNews: ObservableObject {
    @Published var NewsData: NewsModel = NewsModel(news: [])
    static let shared = APIManagerCoinStatsNews()
    
    func fetchData() {
        let url = URL(string: "https://api.coinstats.app/public/v1/news/latest?skip=0&limit=20")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let NewsModel = try decoder.decode(NewsModel.self, from: data)
                DispatchQueue.main.async {
                    self?.NewsData = NewsModel
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

