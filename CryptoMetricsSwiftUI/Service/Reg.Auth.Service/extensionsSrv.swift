//
//  extensionsSrv.swift
//
//  Created by Danila Kardashevkii on 07.07.2023.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func underline() -> some View {
        self.modifier(Underline())
    }
}

struct Underline: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .padding(.leading, 18)
                .foregroundColor(.white)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
        }
    }
}
