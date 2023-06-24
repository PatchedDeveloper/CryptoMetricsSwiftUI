////
////  TableView.swift
////  CryptoMetricsSwiftUI
////
////  Created by Danila Kardashevkii on 23.06.2023.
////
//
//import SwiftUI
//
//struct TableView: View {
//    @State private var coinData: [CoinDatum] = []
//    @State private var timer: Timer?
//    
//    var body: some View {
//        HStack {
//            Text("Name")
//                .foregroundColor(Color("TextSecondColor"))
//            Spacer()
//            Text("Price/Chg. 24h")
//                .foregroundColor(Color("TextSecondColor"))
//        }
//        .padding(.top, 5)
//        .padding(.horizontal, 10)
//        
//        HStack {
//            if coinData.isEmpty {
//                VStack {
//                    ProgressView()
//                    
//                    Text("Please wait loading...")
//                        .foregroundColor(.white)
//                        .padding()
//                }
//            } else {
//                List(coinData, id: \.id) { coin in
//                    HStack {
//                        AsyncImage(url: URL(string: coin.image)) { image in
//                            image
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                        } placeholder: {
//                            // Placeholder image while loading
//                            Color.gray
//                                .frame(width: 20, height: 20)
//                        }
//                        .scaledToFit()
//                        .cornerRadius(10)
//                        
//                        VStack{
//                            HStack {
//                                Text(coin.name)
//                                    .foregroundColor(.white)
//                                Spacer()
//                                Text(String(coin.currentPrice))
//                                    .foregroundColor(.white)
//                            }
//                            .padding(.bottom, -5)
//                            .padding(.top,5)// Уменьшаем отступ снизу
//                            HStack {
//                                Text(coin.symbol)
//                                    .foregroundColor(.gray)
//                                    .font(.system(size: 12))
//                                Spacer()
//                                ZStack{
//                                    let colorprocent = coin.priceChangePercentage24H
//                                    if colorprocent ?? 0 > 0 {
//                                        HStack{
//                                            
//                                        }
//                                        .frame(width: 40, height: 15)
//                                        .background(Color("colorP"))
//                                        .cornerRadius(10)
//                                    }
//                                    else{
//                                        HStack{
//                                            
//                                        }
//                                        .frame(width: 40, height: 15)
//                                        .background(Color("colorM"))
//                                        .cornerRadius(10)
//                                    }
//                              
//                                    ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
//                                }
//                            }
//                           
//                        }
//                        
//                    }
//                    .padding() // Растягиваем ячейку на всю ширину
//                    .background(Color("SecondColor"))
//                    .listRowInsets(EdgeInsets()) // Убираем отступы ячейки
//                }
//                .listStyle(.plain) //
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: 600)
//        .background(Color("SecondColor"))
//        .cornerRadius(10)
//        .padding(.bottom, 5)
//        .onAppear {
//            fetchData() // load data
//            startTimer() // start timer for refreshing data
//        }
//        .onDisappear {
//            stopTimer() // stop timer
//        }
//    }
//    
//    func fetchData() {
//        APIManager.shared.getData { coinData in
//            DispatchQueue.main.async {
//                self.coinData = coinData
//                print("Fetched data from API")
//                saveCoinData() // Save data to memory
//            }
//        }
//    }
//    
//    func saveCoinData() {
//        do {
//            let data = try JSONEncoder().encode(coinData)
//            UserDefaults.standard.set(data, forKey: "coinData")
//            print("Saved data to memory")
//        } catch {
//            print("Error saving coinData: \(error)")
//        }
//    }
//    
//    func startTimer() {
//        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
//            fetchData()
//            print("Data reloaded")
//        }
//    }
//    
//    func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
//}
//
//
//
//struct SearchView: View {
//    @State private var name: String = ""
//    var body: some View {
//        HStack{
//            Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                        .padding(.leading, 18)
//            TextField("Search by Name or Symbol...", text: $name)
//                .foregroundColor(.white)
//                .padding(.vertical)
//                
//        }
//        .background(Color("SecondColor"))
//        .cornerRadius(20)
//        .padding(.vertical,5)
//        .padding(.horizontal,1)
//    }
//    }
//
//
