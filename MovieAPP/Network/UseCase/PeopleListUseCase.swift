//
//  PeopleListUseCase.swift
//  MovieAPP
//
//  Created by Nazrin on 15.12.23.
//

import Foundation

protocol PeopleListUseCase {
    func getPeopleList(pageNumber: Int , completion: @escaping ((People?, String?) -> Void))
}
