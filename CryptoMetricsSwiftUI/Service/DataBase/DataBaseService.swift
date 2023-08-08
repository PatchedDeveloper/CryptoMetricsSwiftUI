//
//  DataBaseService.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 08.08.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService{
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() {}
    
    func setUser(user:MWUser, complition: @escaping (Result<MWUser,Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error{
                complition(.failure(error))
            }else{
                complition(.success(user))
            }
        }
        
    }
    
}
