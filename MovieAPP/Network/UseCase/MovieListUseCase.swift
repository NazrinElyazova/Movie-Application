//
//  MovieListUseCase.swift
//  MovieAPP
//
//  Created by Nazrin on 15.12.23.
//

import Foundation

protocol MovieListUseCase {
    func getMovieList( endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void))
}
