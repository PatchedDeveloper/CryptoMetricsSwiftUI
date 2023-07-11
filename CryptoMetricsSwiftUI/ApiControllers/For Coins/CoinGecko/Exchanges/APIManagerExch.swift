//
//  APIManager.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 06.06.2023.
//
import Foundation

class APIManagerExchanges {
    private var exchData: [ModelExchElement] = []
    static let shared = APIManagerExchanges()
    
    let baseUrl = "https://api.coingecko.com/api/v3/"
    let params = "exchanges?per_page=10"
    
    var urlString: String {return "\(baseUrl)\(params)"}
    
    func getData(completion: @escaping ([ModelExchElement]) -> Void) {
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
                let exchData = try decoder.decode([ModelExchElement].self, from: data)
                completion(exchData)
            } catch {
                print("Error decoding JSON: \(error)")
                completion([])
            }
        }
        
        task.resume()
    }
    
}




