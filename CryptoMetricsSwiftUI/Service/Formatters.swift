//
//  Formatters.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 24.06.2023.
//

import Foundation

func formatNumber(_ number: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.groupingSeparator = ","
    numberFormatter.groupingSize = 3
    numberFormatter.maximumFractionDigits = 8
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.minimumIntegerDigits = 1
    numberFormatter.locale = Locale(identifier: "en_US")
    
    var formattedNumber = ""
    
    if number >= 1_000_000_000 {
        let billionNumber = number / 1_000_000_000
        if billionNumber >= 100 {
            numberFormatter.maximumFractionDigits = 2
        } else {
            numberFormatter.maximumFractionDigits = 3
        }
        formattedNumber = numberFormatter.string(from: NSNumber(value: billionNumber)) ?? ""
        formattedNumber += "Bn"
    } else if number >= 1_000_000 {
        formattedNumber = numberFormatter.string(from: NSNumber(value: number / 1_000_000)) ?? ""
        formattedNumber += "Mn"
    } else if number >= 100 {
        let roundedNumber = Int(number.rounded())
        formattedNumber = numberFormatter.string(from: NSNumber(value: roundedNumber)) ?? ""
    } else if number < 1 && number > 0 {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = .decimal
        decimalFormatter.maximumFractionDigits = 8
        decimalFormatter.minimumFractionDigits = 0
        decimalFormatter.locale = Locale(identifier: "en_US")
        
        formattedNumber = decimalFormatter.string(from: NSNumber(value: number)) ?? ""
    } else if number < 1 {
        let scientificFormatter = NumberFormatter()
        scientificFormatter.numberStyle = .decimal
        scientificFormatter.positiveFormat = "0.###E+0"
        scientificFormatter.negativeFormat = "0.###E-0"
        scientificFormatter.locale = Locale(identifier: "en_US")
        
        formattedNumber = scientificFormatter.string(from: NSNumber(value: number)) ?? ""
    } else {
        formattedNumber = numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    return formattedNumber
}
