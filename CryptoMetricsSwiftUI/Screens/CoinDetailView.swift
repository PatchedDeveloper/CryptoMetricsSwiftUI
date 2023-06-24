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
                           
                            
                        }
                        .padding(.top, -5)
                    }
                }
                .padding(.horizontal)
                
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
                GraphView(price: graphData) // Pass the graph data to GraphView
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
                .padding(.top,10)
                .padding(.horizontal)
                
                HStack{
                    VStack{
                        Text("24h Price Change")
                        .foregroundColor(.gray)
                        
                        Text("$"+formatNumber(Double(coin.high_24h ?? 0)))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                        HStack{
                            if coin.priceChangePercentage24H ?? 0 > 0{
                                ZStack{
                                    Image("aup")
                                        .padding(.leading,-30)
                                    ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                            
                                }
                            }
                            else if coin.priceChangePercentage24H ?? 0 <= 0{
                                ZStack{
                                    Image("adw")
                                        .padding(.leading,-30)
                                    ProcentPrice(procent: coin.priceChangePercentage24H ?? 0)
                                        
                                }
                        }
                        }
                        .padding(.top,-10)
                    }
                    Spacer()
                    VStack{
                        Text("24h MarketCup Change")
                        .foregroundColor(.gray)
                        
                        Text("$"+formatNumber(Double(coin.low_24h ?? 0)))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                        HStack{
                            if coin.market_cap_change_percentage_24h ?? 0 > 0{
                                ZStack{
                                    Image("aup")
                                        .padding(.leading,-30)
                                    ProcentPrice(procent: coin.market_cap_change_percentage_24h ?? 0)
                            
                                }
                            }
                            else if coin.market_cap_change_percentage_24h ?? 0 <= 0{
                                ZStack{
                                    Image("adw")
                                        .padding(.leading,-30)
                                    ProcentPrice(procent: coin.market_cap_change_percentage_24h ?? 0)
                                        
                                }
                        }
                             
                        }
                        .padding(.top,-10)
                    }
                }
                .padding(.top,10)
                .padding(.horizontal)
                
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
                .padding(.top,10)
                .padding(.horizontal)

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







