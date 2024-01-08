//
//  SearchManager.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import Foundation

class SearchManager: SearchListUseCase {
    func getSearchList(endpoint: SearchEndpoint, completion: @escaping ((Search?, String?) -> Void)) {
        NetworkManager.request(model: Search.self, endpoint: endpoint.rawValue) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
    
    
}
