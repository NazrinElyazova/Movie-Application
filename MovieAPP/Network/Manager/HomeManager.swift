//
//  HomeManager.swift
//  MovieAPP
//
//  Created by Nazrin on 15.12.23.
//

import Foundation

class HomeManager: MovieListUseCase {
    func getMovieList(endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkManager.request(model: Movie.self,
                               endpoint: endpoint.rawValue) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            } //FILTER LAZIM OLARSA ISTIFADE ETMELIYIK
        }
    }
}
//interface, usecase, protocol
