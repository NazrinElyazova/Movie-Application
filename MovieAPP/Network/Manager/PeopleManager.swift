//
//  PeopleManager.swift
//  MovieAPP
//
//  Created by Nazrin on 15.12.23.
//

import Foundation

class PeopleManager: PeopleListUseCase {
    func getPeopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void)) {
        let url = PeopleEndpoint.popularPeople.rawValue + "?page=\(pageNumber)"
        NetworkManager.request(model: People.self, endpoint: url) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
