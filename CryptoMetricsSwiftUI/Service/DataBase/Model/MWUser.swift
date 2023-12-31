//
//  MWUser.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 08.08.2023.
//

import Foundation

struct MWUser: Identifiable{
    
    var id : String 
    var name : String
    
    var representation: [String: Any]{
        
        var repres =  [String: Any] ()
        repres["id"] = self.id
        repres["name"] = self.name
        
        return repres
    }
    
}
