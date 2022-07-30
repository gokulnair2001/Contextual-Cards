//
//  UserDefaultsRepository.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 30/07/22.
//

import Foundation
import SwiftUI

struct UserDefaultsRepository {
   
    static let UD = UserDefaults.standard
    
    // SETs Value in user defaults
    static func SET<T: Decodable>(key: String, value: [T]) {
        UD.set(value, forKey: key)
    }
    
    // GETs Value from user defaults
    static func GET<T: Decodable>(key: String) -> [T]? {
        return UD.object(forKey: key) as? [T]
    }
}
