//
//  KeychainManager.swift
//  MovieAPP
//
//  Created by Nazrin on 27.03.24.
//

import Foundation
import Security


class KeychainManager {
    // Set username and password
    let username = "john"
    let password = "1234".data(using: .utf8)!
    // Set attributes
    
  
      private lazy var attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: password,
        ]
    
}
