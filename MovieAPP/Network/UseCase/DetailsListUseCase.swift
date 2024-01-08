//
//  DetailsListUseCase.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import Foundation

protocol DetailsListUseCase {
    func getDetailsList(endpoint: DetailsEndpoint, movieID: Int?, completion: @escaping((Details?, String?) -> Void) )
}
