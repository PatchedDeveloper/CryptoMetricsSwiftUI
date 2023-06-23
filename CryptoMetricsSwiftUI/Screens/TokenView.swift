//
//  TokenView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import SwiftUI

struct TokenView: View {
    @State private var coinData: [CoinDatum] = []
    var body: some View {
        VStack{
            //label
            HStack{
                Text("Live Prices")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            Button {
                print(coinData)
            } label: {
                Text("Click ")
            }

            //window search
            SearchView()
            // ListView with cells
            TableView()
            Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("background"))

  }
}

struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView()
    }
}
