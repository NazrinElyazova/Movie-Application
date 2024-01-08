//
//  DetailsManager.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import Foundation
class DetailsManager: DetailsListUseCase {
    func getDetailsList(endpoint: DetailsEndpoint, movieID: Int?, completion: @escaping ((Details?, String?) -> Void)) {
        NetworkManager.request(model: Details.self, endpoint: "\(endpoint.rawValue)\(movieID ?? 0)") { data, errorMessage in
            if let errorMessage = errorMessage{
                completion(nil, errorMessage)
            } else if let details = data {
                completion(details, nil)
            }
        }
    }
}
