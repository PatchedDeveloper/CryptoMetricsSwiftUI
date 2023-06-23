//
//  TableView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 23.06.2023.
//

import SwiftUI

struct TableView: View {
    @State private var coinData: [CoinDatum] = []
    @State private var timer: Timer?
    
    init() {
         loadCoinData() // Load saved data from memory
     }
    
    var body: some View {
        HStack{
            Text("Name")
                .foregroundColor(Color("TextSecondColor"))
            Spacer()
            Text("Price/Chg. 24h")
                .foregroundColor(Color("TextSecondColor"))
        }
        .padding(.top,5)
        .padding(.horizontal,10)
        
        HStack {
            if coinData.isEmpty {
                VStack{
                    ProgressView()
                        
                    Text("Please wait loading...")
                        .foregroundColor(.white)
                        .padding()
                }
            } else {
                List(coinData, id: \.id) { coin in
                    HStack {
                        AsyncImage(url: URL(string: coin.image)) { image in
                            image
                                .resizable()
                                .frame(width: 40, height: 40)
                        } placeholder: {
                            // Placeholder image while loading
                            Color.gray
                                .frame(width: 20, height: 20)
                        }
                        .scaledToFit()
                        .cornerRadius(10)

                        VStack{
                            Text(coin.name)
                                .foregroundColor(.white)
                        }
                        Spacer()
                            
                    }
                    .padding()// Растягиваем ячейку на всю ширину
                    .background(Color("SecondColor"))
                    .listRowInsets(EdgeInsets()) // Убираем отступы ячейки
                }
                .listStyle(.plain) //
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 600)
        .background(Color("SecondColor"))
        .cornerRadius(10)
        .padding(.bottom, 5)
        .onAppear {
            fetchData()// load data
            startTimer()// reload data 60sec
        }
        .onDisappear {
              stopTimer()//stop reloading data
        }

        }
    func fetchData() {
        if let savedData = UserDefaults.standard.data(forKey: "coinData") {
            if let decodedData = try? JSONDecoder().decode([CoinDatum].self, from: savedData) {
                DispatchQueue.main.async {
                    self.coinData = decodedData
                    print("Loaded data from memory")
                }
            }
        } else {
            APIManager.shared.getData { coinData in
                DispatchQueue.main.async {
                    self.coinData = coinData
                    saveCoinData()
                    print("Fetched data from API")
                }
            }
        }
    }
      
      // Function to save coinData in UserDefaults
      func saveCoinData() {
          let data = try? JSONEncoder().encode(coinData)
          UserDefaults.standard.set(data, forKey: "coinData")
      }
      
      // Function to load coinData from UserDefaults
      func loadCoinData() {
          guard let data = UserDefaults.standard.data(forKey: "coinData") else {
              return
          }
          coinData = try! JSONDecoder().decode([CoinDatum].self, from: data)
      }
    func startTimer() {
          timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
          fetchData()
          print("data reloaded")
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        }
    }




struct SearchView: View {
    @State private var name: String = ""
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 18)
            TextField("Search by Name or Symbol...", text: $name)
                .foregroundColor(.white)
                .padding(.vertical)
                
        }
        .background(Color("SecondColor"))
        .cornerRadius(20)
        .padding(.vertical,5)
        .padding(.horizontal,1)
    }
    }

