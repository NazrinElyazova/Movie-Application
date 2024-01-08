//
//  SearchListUseCase.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import Foundation

protocol SearchListUseCase {
    func getSearchList(endpoint: SearchEndpoint, completion: @escaping((Search?, String?) -> Void))
}
