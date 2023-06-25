//
//  WebView.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 25.06.2023.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
