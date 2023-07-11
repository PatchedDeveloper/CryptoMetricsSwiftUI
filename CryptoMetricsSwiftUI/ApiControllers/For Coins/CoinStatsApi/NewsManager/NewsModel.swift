//
//  NewsModel.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 11.07.2023.
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable{
    let news: [News]
}

// MARK: - News
struct News: Identifiable,Codable {
    let id: String
    let feedDate: Int
    let source, title: String
    let imgURL: String
    let description: String
    
    
}

