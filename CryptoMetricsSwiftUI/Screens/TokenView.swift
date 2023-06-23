//
//  TokenView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI

struct TokenView: View {
    @State private var name: String = ""
    @State private var coinData: [CoinDatum] = []
    @State private var timer: Timer?
    var body: some View {
        VStack{
            HStack{
                Text("Live Prices")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            
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
                            Text("")
                            AsyncImage(url: URL(string: coin.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            } placeholder: {
                                // Placeholder image while loading
                                Color.gray
                                    .frame(width: 20, height: 20)
                            }
                            .scaledToFit()
                            .cornerRadius(10)

                            Text(coin.name)
                        }
                        .padding()// Растягиваем ячейку на всю ширину
                        .listRowInsets(EdgeInsets()) // Убираем отступы ячейки
                        .background(Color("SecondColor")) 
                    }
                    .listStyle(.plain) //
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 600)
            .background(Color("SecondColor"))
            .cornerRadius(10)
            .padding(.bottom, 5)


                  
                Spacer()
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(Color("background"))
              .onAppear {
                       fetchData()// load data
                       startTimer()// reload data 60sec
                   }
                   .onDisappear {
                       stopTimer()//stop reloading data
                   }
          }
          
    func fetchData() {
        APIManager.shared.getData { coinData in
            DispatchQueue.main.async {
                    self.coinData = coinData
                print(coinData)
                  }
              }
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

struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView()
    }
}
