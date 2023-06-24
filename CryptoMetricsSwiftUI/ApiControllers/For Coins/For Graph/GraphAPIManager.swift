import Foundation

class GraphAPIManager {
    static let shared = GraphAPIManager()
    
    let baseUrl = "https://api.coingecko.com/api/v3"
    var nametoken: String = ""
    var days = "1"
    
    func getBitcoinChartData(nametoken: String,days: String, completion: @escaping (Result<ChartData, Error>) -> Void) {
        self.days = days
        self.nametoken = nametoken
        guard let url = URL(string: "\(baseUrl)/coins/\(nametoken)/market_chart?vs_currency=usd&days=\(days)") else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "No data received", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let chartData = try decoder.decode(ChartData.self, from: data)
                completion(.success(chartData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct ChartData: Decodable {
    let prices: [[Double]]
}
