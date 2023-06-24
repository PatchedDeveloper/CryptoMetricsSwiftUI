//
//  File.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 08.06.2023.
//

import Foundation
import SwiftUI


struct ProcentPrice: View {
    let procent24h: Double

    init(procent: Double) {
        procent24h = procent
    }

    var body: some View {
        VStack {

            if procent24h > 0 {
                Text("+\(String(format: "%.2f", procent24h))%")
                    .foregroundColor(Color.green)
                    .font(.custom("SFProText-Light", size: 12))
            } else {
                Text("\(String(format: "%.2f", procent24h))%")
                    .foregroundColor(Color.red)
                    .font(.custom("SFProText-Light", size: 12))
                
            }
        }
        .frame(width: 60, height: 5)
        
    }
}
