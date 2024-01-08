//
//  PeopleInfoManager.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import Foundation

class PeopleInfoManager: PeopleInfoUseCase {
    func getPeopleInfo(endpoint: PeopleInfoEndpoint, peopleID: Int?, completion: @escaping ((PeopleInfo?, String?) -> Void)) {
        NetworkManager.request(model: PeopleInfo.self, endpoint: "\(endpoint.rawValue)\(peopleID ?? 0)/movie_credits") {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            } else if let info = data {
                completion(info, nil)
            }
        }
    }
}
