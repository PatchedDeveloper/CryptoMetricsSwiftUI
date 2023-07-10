import SwiftUI

struct CoinDetailView: View {
    let coin: CoinDatum
    @State private var graphData: [[TimeInterval: Double]] = []
    @State private var graphdays = 1
    
    
    @State private var isSelected: Bool = false
    @State private var isSelected2: Bool = false
    @State private var isSelected3: Bool = false
    @State private var isSelected4: Bool = false
    @State private var isSelected5: Bool = false
    @State private var isSelected6: Bool = false
    @State private var isSelected7: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                //appbar
                HStack {
                    backButton
                        .foregroundColor(.white)
                    Spacer()
                    Text(coin.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    HStack{
                        Text(coin.symbol)
                            .font(.headline)
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                        
                        if let imageURL = URL(string: coin.image) {
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            } placeholder: {
                                // Placeholder image while loading
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding()
                
                HStack{
                    if let imageURL = URL(string: coin.image) {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        } placeholder: {
                            // Placeholder image while loading
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    VStack{
                        HStack{
                            Text("\(coin.name)")
                                .foregroundColor(.white)
                            Spacer()
                            HStack{
                                Text("$"+formatNumber(Double(coin.currentPrice)))
                                    .foregroundColor(.white)
                                    .padding(.leading,-5)
                                    .padding(.trailing,10)
                                    .fontWeight(.bold)
                            }
                            
                        }
                        .padding(.bottom, -5)
                        .padding(.top, 5)
                        HStack{
                            Text("\(coin.symbol)")
                                .foregroundColor(.gray)
                            Spacer()
                         
                            //procent
                            ZStack {
                                let colorprocent = coin.priceChangePercentage24H
                                if colorprocent ?? 0 > 0 {
                                    HStack {
                                    }
                                    .frame(width: 40, height: 15)
                                    .background(Color("colorP"))
                                    .cornerRadius(10)
                                } else {
                                    HStack {
                                    }
                                    .frame(width: 40, height: 15)
                                    .background(Color("colorM"))
                                    .cornerRadius(10)
                                }
                                ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                         
                            }
                            let colorchange = coin.price_change_24h
                            if colorchange ?? 0 > 0 {
                                Text("+$" + String(format: "%.2f", coin.price_change_24h ?? 0))

                                    .foregroundColor(.green)
                                    .padding(.leading,-5)
                                    .font(.custom("SFProText-Light", size: 12))
                              
                            } else {
                                Text("+$" + String(format: "%.2f", coin.price_change_24h ?? 0))
                                    .foregroundColor(.red)
                                    .padding(.leading,-5)
                                    .font(.custom("SFProText-Light", size: 12))
                            }

                        }
                        .padding(.top, -5)
                    }
                }
                .padding(.horizontal)
                
                ScrollView(){
                    HStack{
                        Button {
                            isSelected = true
                            isSelected2 = false
                            isSelected3 = false
                            isSelected4 = false
                            isSelected5 = false
                            isSelected6 = false
                            isSelected7 = false
                            graphdays = 1
                            fetchChartData()
                        } label: {
                            Text("1d")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)
                        Button {
                            isSelected = false
                            isSelected2 = true
                            isSelected3 = false
                            isSelected4 = false
                            isSelected5 = false
                            isSelected6 = false
                            isSelected7 = false
                            graphdays = 3
                            fetchChartData()
                        } label: {
                            Text("3d")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected2 ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)
                        Button {
                            isSelected = false
                            isSelected2 = false
                            isSelected3 = true
                            isSelected4 = false
                            isSelected5 = false
                            isSelected6 = false
                            isSelected7 = false
                            graphdays = 7
                            fetchChartData()
                        } label: {
                            Text("1w")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected3 ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)
                        Button {
                            isSelected = false
                            isSelected2 = false
                            isSelected3 = false
                            isSelected4 = true
                            isSelected5 = false
                            isSelected6 = false
                            isSelected7 = false
                            graphdays = 30
                            fetchChartData()
                        } label: {
                            Text("1m")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected4 ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)
                        Button {
                            isSelected = false
                            isSelected2 = false
                            isSelected3 = false
                            isSelected4 = false
                            isSelected5 = true
                            isSelected6 = false
                            isSelected7 = false
                            graphdays = 90
                            fetchChartData()
                        } label: {
                            Text("3m")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected5 ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)
                        Button {
                            isSelected = false
                            isSelected2 = false
                            isSelected3 = false
                            isSelected4 = false
                            isSelected5 = false
                            isSelected6 = true
                            isSelected7 = false
                            graphdays = 180
                            fetchChartData()
                        } label: {
                            Text("6m")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected6 ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)
                        Button {
                            isSelected = false
                            isSelected2 = false
                            isSelected3 = false
                            isSelected4 = false
                            isSelected5 = false
                            isSelected6 = false
                            isSelected7 = true
                            graphdays = 365
                            fetchChartData()
                        } label: {
                            Text("1y")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44,height: 26)
                        .background(isSelected7 ? Color("toggle") : Color("SecondColor"))
                        .cornerRadius(20)

                    }
                    GraphView(price: graphData)
                        .frame(height: 180)// Pass the graph data to GraphView
                        .padding(.horizontal)
                        .cornerRadius(20)
                        .padding(.top,10)
                    
                    HStack{
                        VStack{
                            Text("Rank")
                            .foregroundColor(.gray)
                            
                            Text(String(coin.market_cap_rank))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                        }
                        Spacer()
                        VStack{
                            Text("Market Capitalization")
                            .foregroundColor(.gray)
                            
                            Text("$"+formatNumber(Double(coin.market_cap)))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                        }
                        Spacer()
                        VStack{
                            Text("Volume")
                            .foregroundColor(.gray)
                            
                            Text("$"+formatNumber(Double(coin.total_volume ?? 0)))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                        }
                    }
                    .padding(.top,10)
                    .padding(.horizontal)
                    
                    Text("Additional Details")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 10)
                    
                    
                    
                    
                    HStack{
                        // 1 colimn
                        HStack{
                            VStack{
                                Text("24h High")
                                .foregroundColor(.gray)
                                
                                Text("$"+formatNumber(Double(coin.high_24h ?? 0)))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                            }
                           Spacer()
                            VStack{
                                Text("24h Low")
                                .foregroundColor(.gray)
                                
                                Text("$"+formatNumber(Double(coin.low_24h ?? 0)))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.horizontal,50)
                    }
                    .background(Color("SecondColor"))
                    .cornerRadius(5)
                    .padding(.horizontal,10)
                  
                    //2 column
                    HStack{
                        HStack{
                            VStack{
                                Text("24h Price Change")
                                .foregroundColor(.gray)
                                
                                HStack{
                                    Text("$"+formatNumber(Double(coin.high_24h ?? 0)))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 14))
                                    HStack{
                                        if coin.priceChangePercentage24H ?? 0 > 0{
                                            HStack{
                                                Image("aup")
                                                 
                                                ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                                                    .padding(.leading,-5)
                                            }
                                        }
                                        else if coin.priceChangePercentage24H ?? 0 <= 0{
                                            HStack{
                                                Image("adw")
                                               
                                                ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                                                    .padding(.leading,-5)
                                            }
                                    }
                                    }
                                }
                                .padding(.top,-10)
                            }
                            Spacer()
                            VStack{
                                Text("24h MarketCup Change")
                                .foregroundColor(.gray)
                                
                                HStack{
                                    Text("$"+formatNumber(Double(coin.low_24h ?? 0)))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 14))
                                    HStack{
                                        if coin.market_cap_change_percentage_24h ?? 0 > 0{
                                            HStack{
                                                Image("aup")
                                          
                                                ProcentPrice(procent: coin.market_cap_change_percentage_24h ?? 0)
                                                    .padding(.leading,-5)
                                        
                                            }
                                        }
                                        else if coin.market_cap_change_percentage_24h ?? 0 <= 0{
                                            HStack{
                                                Image("adw")
                                                 
                                                ProcentPrice(procent: coin.market_cap_change_percentage_24h ?? 0)
                                                    .padding(.leading,-5)
                                            }
                                    }
                                         
                                    }
                                }
                                .padding(.top,-10)
                           
                            }
                        }
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.horizontal)
                    }
                    .background(Color("SecondColor"))
                    .cornerRadius(5)
                    .padding(.horizontal,10)
                    
                    //3 column
                    HStack{
                        HStack{
                            VStack{
                                Text("Total Supply")
                                    .foregroundColor(.gray)
                                
                                Text(formatNumber(Double(coin.total_supply ?? 0)))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                
                            }
                            Spacer()
                            VStack{
                                Text("Max Supply")
                                    .foregroundColor(.gray)
                                if coin.max_supply ?? 0 > 0 {
                                Text(formatNumber(Double(coin.max_supply ?? 0)))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                }
                                else if coin.max_supply ?? 0 <= 0{
                                    Text("∞")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 14))
                                }
                                
                            }
                        }
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.horizontal)
                        
                    }
                    .background(Color("SecondColor"))
                    .cornerRadius(5)
                    .padding(.horizontal,10)
                    
                    //4 column
                    HStack{
                        HStack{
                            Text("Circulating Supply")
                                .foregroundColor(.gray)
                            Spacer()
                            Text(String(coin.circulating_supply ?? 0))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                        }
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.horizontal)
                        
                    }
                    .background(Color("SecondColor"))
                    .cornerRadius(5)
                    .padding(.horizontal,10)
                    
                    
                    VStack{
                        Image("line")
                              .resizable()
                              .padding(.horizontal)
                              .padding(.top,15)
                        HStack{
                            Text("Analysis")
                                .foregroundColor(.white)
                          Image(systemName: "info.circle")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                        
                }
                
            
                
              Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("background")) // Set the desired background color here
            
        }
        .navigationBarHidden(true)
        .onAppear {
            fetchChartData()
        }
        
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
            Text("BACK")
                .foregroundColor(.white)
        }
    }
    
    
    func fetchChartData() {
        GraphAPIManager.shared.getBitcoinChartData(nametoken: coin.id,days: String(graphdays)) { result in
            switch result {
            case .success(let chartData):
                let convertedData = chartData.prices.map { [$0[0]: $0[1]] }
                graphData = convertedData
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}


struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let coin = CoinDatum(id: "bitcoin", name: "Bitcoin", symbol: "BTC", image: "bitcoin", market_cap_rank: 50000, market_cap: 10, total_volume: 2000, high_24h: 1, low_24h: 1000000000, market_cap_change_percentage_24h: 5000000, total_supply: 55000, max_supply: 48000, price_change_24h: 21000000, circulating_supply: 123142, currentPrice: 12500,sparklineIn7D: SparklineIn7D(price: [1,2,3,4,5,6,7]), priceChangePercentage24H: 12)
        
        CoinDetailView(coin: coin)
    }
}




